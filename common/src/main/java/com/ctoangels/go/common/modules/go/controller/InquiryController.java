package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Inquiry 控制层
 *
 */
@Controller
@RequestMapping("inquiry")
public class InquiryController {
    @RequestMapping
    public String page() {
        return "go/inquiry/list";
    }

}