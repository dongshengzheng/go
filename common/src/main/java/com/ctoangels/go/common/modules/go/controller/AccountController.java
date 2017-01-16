package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Account 控制层
 *
 */
@Controller
@RequestMapping("account")
public class AccountController {
    @RequestMapping
    public String page() {
        return "go/account/list";
    }

}