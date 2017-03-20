package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.Style;
import com.ctoangels.go.common.modules.go.service.IStyleService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.modules.sys.entity.User;
import com.ctoangels.go.common.modules.sys.service.UserService;
import com.ctoangels.go.common.util.Const;
import com.ctoangels.go.common.util.MailUtil;
import com.ctoangels.go.common.util.Tools;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;


/**
 * Account 控制层
 */
@Controller
@RequestMapping("account")
public class AccountController extends BaseController {
    @Autowired
    private UserService userService;

    @Autowired
    private IStyleService styleService;

    @RequestMapping
    public String page() {
        return "go/account/list";
    }

    //修改姓名
    @RequestMapping(value = "/editName", method = RequestMethod.GET)
    public String editName() {
        return "go/account/edit_name";
    }

    @RequestMapping(value = "/editName", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editNameComplete(@RequestParam(required = false) String name,
                                       @RequestParam(required = false) String code,
                                       HttpSession session) {
        JSONObject jsonObject = new JSONObject();
        String sessionCode = (String) session.getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码
        // 关闭验证码
        boolean useValiCode = true;
        if (useValiCode && (null == code || "".equals(code))) {
            // 验证码为空
            jsonObject.put("msg", "null code");
            jsonObject.put("status", 0);
        } else {
            if (!useValiCode || (Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code))) {
                User user = (User) session.getAttribute(Const.SESSION_USER);
                user.setName(name);
                userService.updateById(user);
                session.removeAttribute(Const.SESSION_SECURITY_CODE);
                jsonObject.put("msg", "修改成功!");
                jsonObject.put("status", 1);
            } else {
                // 验证码输入有误
                jsonObject.put("msg", "code error");
                jsonObject.put("status", 0);
            }
        }
        return jsonObject;
    }

    //修改Email
    @RequestMapping(value = "/editEmail", method = RequestMethod.GET)
    public String editEmail() {
        return "go/account/edit_email";
    }

    @RequestMapping(value = "/editEmail", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editEmailComplete(@RequestParam(required = false) String code,
                                        HttpSession session) {
        JSONObject jsonObject = new JSONObject();
        int status = 0;
        String msg = "";
        if (Tools.notEmpty(code)) {
            if (code.equals(session.getAttribute("sessionChangeEmailCode"))) {
                User user = getCurrentUser();
                user.setEmail((String) session.getAttribute("sessionChangeEmail"));
                userService.updateById(user);
                status = 1;
                msg = "更改成功";
                session.removeAttribute("sessionChangeEmail");
                session.removeAttribute("sessionChangeEmailCode");
            }
        }
        if (status == 0) {
            msg = "验证码错误!";
        }
        jsonObject.put("msg", msg);
        jsonObject.put("status", status);
        return jsonObject;
    }

    @RequestMapping(value = "/editEmail/sendCode", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject sendCode(@RequestParam(required = false) String email,
                               HttpSession session) {
        JSONObject jsonObject = new JSONObject();
        if (Tools.notEmpty(email)) {
            User user = new User();
            user.setEmailStatus(Const.EMAIL_ACTIVATE_STATUS_HAVE);
            user.setEmail(email);
            user = userService.selectOne(user);
            if (user == null) {
                MailUtil.sendChangeEmailCode(email, session);
                jsonObject.put("suc", true);
            } else {
                jsonObject.put("errInfo", "email used");//邮箱已被使用
                jsonObject.put("suc", false);
            }
        } else {
            jsonObject.put("errInfo", "email empty");//邮箱为空
            jsonObject.put("suc", false);
        }
        return jsonObject;
    }


    //修改密码
    @RequestMapping(value = "/editPassword", method = RequestMethod.GET)
    public String editPassword() {
        return "go/account/edit_password";
    }

    @RequestMapping(value = "/editPassword", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editPasswordComplete(@RequestParam(required = false) String oldPwd,
                                           @RequestParam(required = false) String newPwd,
                                           @RequestParam(required = false) String newPwdCon,
                                           HttpSession session) {
        JSONObject jsonObject = new JSONObject();
        User user = (User) session.getAttribute(Const.SESSION_USER);
        String password = user.getPassword();
        String loginName = user.getLoginName();
        if (Tools.notEmpty(oldPwd) && password.equals(new SimpleHash("SHA-1", loginName, oldPwd).toString())) {
            if (newPwd != null && newPwd.trim().length() >= 5) {
                if (newPwd.equals(newPwdCon)) {
                    newPwd = new SimpleHash("SHA-1", loginName, newPwd).toString();
                    user.setPassword(newPwd);
                    userService.updateById(user);
                    jsonObject.put("status", 1);
                } else {
                    jsonObject.put("msg", "pwd is not same");
                    jsonObject.put("status", 0);
                }
            } else {
                jsonObject.put("msg", "newPwd length not enough");
                jsonObject.put("status", 0);
            }
        } else {
            jsonObject.put("msg", "oldPwd error");
            jsonObject.put("status", 0);
        }
        return jsonObject;
    }

    //修改电话
    @RequestMapping(value = "/editPhone", method = RequestMethod.GET)
    public String editPhone() {
        return "go/account/edit_phone";
    }

    @RequestMapping(value = "/editPhone", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editPhoneComplete(@RequestParam(required = false) String name,
                                        @RequestParam(required = false) String code,
                                        HttpSession session) {
        JSONObject jsonObject = new JSONObject();
        return jsonObject;
    }

    //修改样式
    @RequestMapping(value = "/editStyle", method = RequestMethod.GET)
    public String changeStyle(ModelMap map) {
        List<Style> styleList = styleService.selectList(new EntityWrapper<>(new Style()));
        map.put("styleList", styleList);
        return "go/account/edit_style";
    }

    @RequestMapping(value = "/editStyle", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editStyleComplete(@RequestParam(required = false) Integer styleId) {
        JSONObject jsonObject = new JSONObject();
        if (styleId != 0) {
            User currentUser = getCurrentUser();
            currentUser.setStyleId(styleId);
            userService.updateById(currentUser);
            jsonObject.put("status", 1);
        } else {
            jsonObject.put("msg", "请选择一个样式");
            jsonObject.put("status", 0);
        }
        return jsonObject;
    }


}