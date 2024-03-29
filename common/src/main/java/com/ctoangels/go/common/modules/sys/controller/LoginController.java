package com.ctoangels.go.common.modules.sys.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.Style;
import com.ctoangels.go.common.modules.go.service.IStyleService;
import com.ctoangels.go.common.modules.sys.entity.Button;
import com.ctoangels.go.common.modules.sys.entity.MailAuthenticator;
import com.ctoangels.go.common.modules.sys.entity.Menu;
import com.ctoangels.go.common.modules.sys.entity.User;
import com.ctoangels.go.common.modules.sys.service.LoginService;
import com.ctoangels.go.common.modules.sys.service.UserService;
import com.ctoangels.go.common.util.Const;
import com.ctoangels.go.common.util.MD5;
import com.ctoangels.go.common.util.MailUtil;
import com.ctoangels.go.common.util.Tools;
import com.sun.corba.se.impl.resolver.LocalResolverImpl;
import com.sun.corba.se.spi.resolver.LocalResolver;
import org.apache.http.HttpResponse;
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
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Security;
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
    private SessionLocaleResolver resolver;

    @Autowired
    private UserService userService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private IStyleService iStyleService;

    @Value("${site_path}")
    private String sitePath;

    @Value("${SYSNAME}")
    private String sysName;

    @Value("${fromAddress}")
    private String fromAddress;

    @Value("${fromPassword}")
    private String fromPassword;

    @Value("${mail.smtp.host}")
    private String mailSmtpHost;

    @Value("${mail.smtp.port}")
    private String mailSmtpPort;

    @Value("${effectiveTime}")
    private String effectiveTime;


    @RequestMapping(value = "path")
    @ResponseBody
    public String path() {
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
        jsonObject.put("sysname", sysName);
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
                errInfo = "null code";
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
                        errInfo = "user error"; // 用户名或密码有误
                    }
                } else {
                    errInfo = "code error"; // 验证码输入有误
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


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "sys/admin/register";
    }

    @RequestMapping(value = "/register_register", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject register(String keyData) throws Exception {
        JSONObject jsonObject = new JSONObject();
        String errInfo = "";
        keyData = keyData.replaceAll("ksbadmtn1f2izwqy", "");
        keyData = keyData.replaceAll("ipvb5cxat0zn9eg7", "");
        String keyDatas[] = keyData.split(",00,");
        if (null != keyDatas && keyDatas.length == 4) {
            // shiro管理的session
            String sessionCode = (String) session.getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码
            String code = keyDatas[3];
            // 关闭验证码
            boolean useValiCode = true;
            if (useValiCode && (null == code || "".equals(code))) {
                // 验证码为空
                errInfo = "null code";
            } else {
                String registerName = keyDatas[0];
                String password = keyDatas[1];
                String email = keyDatas[2];
                if (!useValiCode || (Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code))) {
                    User user = new User();
                    user.setLoginName(registerName);
                    user.setEmailStatus(null);
                    user = userService.selectOne(user);
                    // 用于验证用户名和密码，改方法名需要改良
                    if (user == null) {
                        User emailUser = new User();
                        emailUser.setEmail(email);
                        emailUser = userService.selectOne(emailUser);
                        if (emailUser != null) {
                            errInfo = "email error";//邮箱已被使用
                        }
                        session.removeAttribute(Const.SESSION_SECURITY_CODE);
                    } else {
                        errInfo = "user error"; // 用户名已存在
                    }
                } else {
                    errInfo = "code error"; // 验证码输入有误
                }
                if (Tools.isEmpty(errInfo)) {
                    errInfo = "success"; // 验证成功
                    String validateCode = MD5.md5(email);
                    String passwd = new SimpleHash("SHA-1", registerName, password).toString(); // 密码加密
                    //若之前有注册了未激活的邮箱,则覆盖掉
                    User newUser = new User();
                    newUser.setEmail(email);
                    newUser.setEmailStatus(Const.EMAIL_ACTIVATE_STATUS_NOT);
                    newUser = userService.selectOne(newUser);
                    if (newUser == null) {
                        newUser = new User();
                    }
                    newUser.setLoginName(registerName);
                    newUser.setName(registerName);
                    newUser.setPassword(passwd);
                    newUser.setEmail(email);
                    newUser.setEmailStatus(Const.EMAIL_ACTIVATE_STATUS_NOT);
                    newUser.setEmailTime(new Date());
                    newUser.setEmailCode(validateCode);
                    userService.insertOrUpdate(newUser);
                    MailUtil.sendActivateEmail(email, validateCode);
                }
            }
        } else {
            errInfo = "error"; // 缺少参数
        }
        jsonObject.put("result", errInfo);
        return jsonObject;
    }

    @RequestMapping(value = "/register/activate", method = RequestMethod.GET)
    public String registerActivate() throws Exception {
        return "sys/admin/activate";
    }

    @RequestMapping(value = "/register/activateConfirm", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject registerActivateConfirm(@RequestParam(required = false) String email,
                                              @RequestParam(required = false) String validateCode) throws Exception {
        JSONObject jsonObject = new JSONObject();
        String errInfo = "";
        User u = new User();
        u.setEmail(email);
        u.setEmailStatus(Const.EMAIL_ACTIVATE_STATUS_NOT);
        User newUser = userService.selectOne(u);
        if (newUser != null &&
                newUser.getEmailStatus() == Const.EMAIL_ACTIVATE_STATUS_NOT &&
                (newUser.getEmailTime().getTime() + 1000 * 60 * Integer.parseInt(effectiveTime)) >= new Date().getTime() &&
                newUser.getEmailCode().equals(validateCode)) {
            newUser.setEmailStatus(Const.EMAIL_ACTIVATE_STATUS_HAVE);
            errInfo = "activate success";
            userService.updateById(newUser);
        } else {
            errInfo = "activate failure";
        }
        jsonObject.put("errInfo", errInfo);
        return jsonObject;
    }


    /**
     * 访问系统首页
     */
    @RequestMapping(value = "/sys/index")
    public String login_index(ModelMap map) {
        // 加载所有菜单
        map.put("changeMenu", "yes");
        map.put("sysname", sysName); // 读取系统名称
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
                Integer styleId = user.getStyleId();
                Style style;
                if (styleId == null) {
                    style = iStyleService.selectById(1);
                } else {
                    style = iStyleService.selectById(styleId);
                    if (style == null) {
                        style = iStyleService.selectById(1);
                    }
                }
                map.put("style", style);
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
        Locale locale = LocaleContextHolder.getLocale();
        String language = locale.getDisplayLanguage();
        if (language.equals("中文") || language.equals("Chinese")) {
            session.setAttribute("language", 0);
        } else if (language.equals("英文") || language.equals("English")) {
            session.setAttribute("language", 1);
        }

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
                if (language.equals("英文") || language.equals("English")) {
                    menu = changeLanguage(menu);
                }

                allRightsUrls.add(menu.getMenuUrl());

                Map<String, Integer> params = new HashMap<>();
                params.put("userId", sysUser.getId());
                params.put("menuId", menu.getId());

                List<Menu> subMenus = loginService.getRightsSubMenus(params);
                menu.setSubMenu(subMenus);

                for (Menu subMenu : subMenus) {
                    if (language.equals("英文") || language.equals("English")) {
                        subMenu = changeLanguage(subMenu);
                    }
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
        map.put("sysname", sysName);
        return "sys/admin/login";
    }

    //试用入口
    @RequestMapping(value = "/tryOut", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject tryOut() {
        JSONObject jsonObject = new JSONObject();
        User user = userService.getTryUser();
        if (user == null) {
            jsonObject.put("success", false);
        } else {
            jsonObject.put("user", user);
            jsonObject.put("success", true);
            String sessionCode = (String) session.getAttribute(Const.SESSION_SECURITY_CODE);
            jsonObject.put("sessionCode", sessionCode);
        }

        return jsonObject;
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    @ResponseBody
    public String test(HttpServletResponse response, String callback) {
        JSONObject jsonObject = new JSONObject();
        long time = new Date().getTime();
        String result = "";
        for (long i = 0; i < 100; i++) {
            result += "[" + time + i * 1000L + "," + i * 5L + "],";
        }
        if (result.length() > 0) {
            result.substring(0, result.length() - 1);
        }
        String data = callback + "([" + result + "])";
//        jsonObject.put("callback", data);
        response.setHeader("Access-Control-Allow-Origin", "*");
        return data;
    }

    @RequestMapping(value = "/test2", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject test2(HttpServletResponse response, String callback) {
        JSONObject jsonObject = new JSONObject();
        long time = new Date().getTime();
        List<Double[]> stringList = new ArrayList<>();
        for (long i = 0; i < 100000; i++) {
            stringList.add(new Double[]{(time + i * 10000D), Math.random() * 100 + i * 0.0005});
        }
        jsonObject.put("callback", stringList);
        response.setHeader("Access-Control-Allow-Origin", "*");
        return jsonObject;
    }

    @RequestMapping(value = "/changeLang", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject changeLang(HttpServletResponse response, @RequestParam(required = false, defaultValue = "cn") String lang) {

        JSONObject jsonObject = new JSONObject();
        if ("cn".equals(lang)) {
            session.setAttribute("WW_TRANS_I18N_LOCALE", Locale.CHINA);
        } else if ("en".equals(lang)) {
            session.setAttribute("WW_TRANS_I18N_LOCALE", Locale.ENGLISH);
        }
        return jsonObject;
    }


    @RequestMapping("/language")
    public ModelAndView language(HttpServletRequest request, HttpServletResponse response, String language) {
        language = language.toLowerCase();
        if (language == null || language.equals("")) {
            return new ModelAndView("redirect:/");
        } else {
            if (language.equals("zh")) {
                resolver.setLocale(request, response, Locale.CHINA);
            } else if (language.equals("en")) {
                resolver.setLocale(request, response, Locale.ENGLISH);
            } else {
                resolver.setLocale(request, response, Locale.CHINA);
            }
        }

        return new ModelAndView("redirect:/");
    }

    private static Menu changeLanguage(Menu m) {
        if (m.getMenuName().equals("基础信息")) {
            m.setMenuName("Basic information");
        } else if (m.getMenuName().equals("船舶信息")) {
            m.setMenuName("Vessel details");
        } else if (m.getMenuName().equals("船厂信息")) {
            m.setMenuName("Shipyard details");
        } else if (m.getMenuName().equals("公司信息")) {
            m.setMenuName("Company details");
        } else if (m.getMenuName().equals("维修工程单")) {
            m.setMenuName("Repair specification");
        } else if (m.getMenuName().equals("维修范本单")) {
            m.setMenuName("Repair specification example");
        } else if (m.getMenuName().equals("工程单询价")) {
            m.setMenuName("Repair cost inquiry");
        } else if (m.getMenuName().equals("工程单比价")) {
            m.setMenuName("Repair quotation comparison");
        } else if (m.getMenuName().equals("维修进度")) {
            m.setMenuName("Repair progress");
        } else if (m.getMenuName().equals("维修工程管理")) {
            m.setMenuName("Repair work management");
        } else if (m.getMenuName().equals("维修进度汇报")) {
            m.setMenuName("Repair progress report");
        } else if (m.getMenuName().equals("系统配置")) {
            m.setMenuName("System settings");
        } else if (m.getMenuName().equals("账号设置")) {
            m.setMenuName("Account settings");
        } else if (m.getMenuName().equals("公司资料")) {
            m.setMenuName("Company information");
        } else if (m.getMenuName().equals("权限管理")) {
            m.setMenuName("Authority management");
        } else if (m.getMenuName().equals("用户管理")) {
            m.setMenuName("User management");
        } else if (m.getMenuName().equals("角色管理")) {
            m.setMenuName("Role management");
        }
        return m;
    }
}
