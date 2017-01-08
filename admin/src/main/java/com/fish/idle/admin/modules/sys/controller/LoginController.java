package com.fish.idle.admin.modules.sys.controller;

import com.alibaba.fastjson.JSONObject;
import com.fish.idle.admin.controller.BaseController;
import com.fish.idle.service.modules.sys.entity.Button;
import com.fish.idle.service.modules.sys.entity.Menu;
import com.fish.idle.service.modules.sys.entity.User;
import com.fish.idle.service.modules.sys.service.LoginService;
import com.fish.idle.service.modules.sys.service.UserService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.Tools;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName LoginController.java
 * @Description:
 * @Date Apr 17, 2015
 */
@Controller
public class LoginController extends BaseController {

    private static Logger logger = LoggerFactory.getLogger(LoginController.class);


    @Autowired
    private UserService userService;

    @Autowired
    private LoginService loginService;

    @Value("${site_path}")
    private String sitePath;

    @RequestMapping(value = "path")
    @ResponseBody
    public String path(){
        return sitePath;
    }

    /**
     * 访问登录页
     *
     * @return
     */
    @RequestMapping(value = "/login_toLogin")
    public String toLogin() throws Exception {
        JSONObject jsonObject = new JSONObject();
        // TODO: 29/11/2016 改成读取properties 此处系统中似乎没有用的上
        jsonObject.put("sysname", Tools.readTxtFile(Const.SYSNAME));
        return "sys/admin/login";
    }

    /**
     * 请求登录，验证用户
     */
    @RequestMapping(value = "/login_login")
    @ResponseBody
    public JSONObject login(String keyData) throws Exception {
        JSONObject jsonObject = new JSONObject();
        String errInfo = "";
        keyData = keyData.replaceAll("ksbadmtn1f2izwqy", "");
        keyData = keyData.replaceAll("ipvb5cxat0zn9eg7", "");
        String keyDatas[] = keyData.split(",00,");
        if (null != keyDatas && keyDatas.length == 3) {
            // shiro管理的session
            Subject currentUser = SecurityUtils.getSubject();
              Session session = currentUser.getSession();
            String sessionCode = (String) session.getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码
            // TODO: 29/11/2016 此处明显有问题，后续进行逻辑修复：登录超过三次才显示验证码
            String code = keyDatas[2];
            // 关闭验证码
            boolean useValiCode = true;
            if (useValiCode && (null == code || "".equals(code))) {
                // 验证码为空
                errInfo = "nullcode";
            } else {
                String loginName = keyDatas[0];
                String password = keyDatas[1];
                if (!useValiCode || (Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code))) {
                    String passwd = new SimpleHash("SHA-1", loginName, password).toString(); // 密码加密
                    User user = new User();
                    user.setLoginName(loginName);
                    user.setPassword(passwd);
                    user = userService.selectOne(user);
                    // 用于验证用户名和密码，改方法名需要改良
                    if (user != null) {
                        User u = new User();
                        u.setId(user.getId());
                        u.setLastLogin(new Date());
                        user.setId(user.getId());
                        // TODO: 29/11/2016 研究update机制
                        userService.updateSelectiveById(u);
                        session.setAttribute(Const.SESSION_USER, user);
                        session.removeAttribute(Const.SESSION_SECURITY_CODE);
                        // shiro加入身份验证
                        Subject subject = SecurityUtils.getSubject();
                        UsernamePasswordToken token = new UsernamePasswordToken(loginName, password);
                        try {
                            subject.login(token);
                        } catch (AuthenticationException e) {
                            errInfo = "身份验证失败！";
                        }
                    } else {
                        errInfo = "usererror"; // 用户名或密码有误
                    }
                } else {
                    errInfo = "codeerror"; // 验证码输入有误
                }
                if (Tools.isEmpty(errInfo)) {
                    errInfo = "success"; // 验证成功
                }
            }
        } else {
            errInfo = "error"; // 缺少参数
        }
        jsonObject.put("result", errInfo);
        return jsonObject;
    }

    /**
     * 访问系统首页
     */
    @RequestMapping(value = "/sys/index")
    public String login_index(ModelMap map) {
        // 加载所有菜单
        map.put("changeMenu", "yes"); // TODO: 29/11/2016 ??
        map.put("sysname", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
        try {
            // shiro管理的session
            Subject currentUser = SecurityUtils.getSubject();
            Session session = currentUser.getSession();
            User user = (User) session.getAttribute(Const.SESSION_USER);
            if (user != null) {
                initRights(user, session);
                session.setAttribute(Const.SESSION_USERNAME, user.getLoginName()); // 放入用户名
                map.put("user", user);
                map.put("menuList", session.getAttribute(Const.SESSION_ALLMENULIST));
                return "sys/index";
            }

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return "sys/admin/login";
        }
        return "sys/admin/login";
    }

    /**
     * 进入tab标签
     *
     * @return
     */
    @RequestMapping(value = "/tab")
    public String tab() {
        return "system/admin/tab";
    }

    private void initRights(User sysUser, Session session) {

        try {

            // 当前用户下的所有menu
            // List<Menu> menuList=new ArrayList<>();
            // 当前用户下的所有button
            List<Button> buttonList = new ArrayList<>();

            List<String> allRightsUrls = new ArrayList<>();

            List<String> roles = loginService.getRightsRolesId(sysUser.getId());
            session.setAttribute(Const.SESSION_ROLES_NAME, roles);
            // info.addRoles(roles);// TODO change to roleCode

            // 添加菜单权限信息（含分类菜单）
            List<Menu> menus = loginService.getRightsParentMenus(sysUser.getId());
            // menuList.addAll(menus);
            for (Menu menu : menus) {
                allRightsUrls.add(menu.getMenuUrl());

                Map<String, Integer> params = new HashMap<>();
                params.put("userId", sysUser.getId());
                params.put("menuId", menu.getId());

                List<Menu> subMenus = loginService.getRightsSubMenus(params);
                menu.setSubMenu(subMenus);

                for (Menu subMenu : subMenus) {
                    allRightsUrls.add(subMenu.getMenuUrl());
                }

            }

            // 添加按钮权限信息
            List<Button> buttons = loginService.getRightsButtons(sysUser.getId());
            buttonList.addAll(buttons);
            for (Button button : buttons) {
                allRightsUrls.add(button.getButtonUrl());
            }

            // shiro用到权限列表
            session.setAttribute(Const.SESSION_ALL_RIGHTS_URL, allRightsUrls);

            // 菜单和按钮数据，用于登陆成功后生成菜单树
            session.setAttribute(Const.SESSION_ALLMENULIST, menus);
            session.setAttribute(Const.SESSION_ALLBUTTONLIST, buttonList);

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    /**
     * 进入首页后的默认页面
     *
     * @return
     */
    @RequestMapping(value = "/login_default")
    public String defaultPage() {
        return "system/admin/default";
    }

    /**
     * 用户注销
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/logout")
    public String logout(ModelMap map) {
        // shiro销毁登录，logout的时候shiro会删掉所有session
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        map.put("sysname", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称 TODO:更改读取方式
        return "sys/admin/login";
    }

}
