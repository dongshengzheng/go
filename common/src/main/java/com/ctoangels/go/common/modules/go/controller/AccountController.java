package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.ctoangels.go.common.modules.sys.entity.User;
import com.ctoangels.go.common.modules.sys.service.UserService;
import com.ctoangels.go.common.util.Const;
import com.ctoangels.go.common.util.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Account 控制层
 */
@Controller
@RequestMapping("account")
public class AccountController {
    @Autowired
    private UserService userService;


    @RequestMapping
    public String page() {
        return "go/account/list";
    }


    @RequestMapping(value = "/editStyle")
    public String changeStyle() {
        return "go/account/edit_style";
    }

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
                jsonObject.put("status", 1);
            } else {
                // 验证码输入有误
                jsonObject.put("msg", "code error");
                jsonObject.put("status", 0);
            }
        }
        return jsonObject;
    }
}