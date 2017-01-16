package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Management 控制层
 *
 */
@Controller
@RequestMapping("management")
public class ManagementController {
    @RequestMapping
    public String page() {
        return "go/management/list";
    }

}