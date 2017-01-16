package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Yard 控制层
 *
 */
@Controller
@RequestMapping("yard")
public class YardController {
    @RequestMapping
    public String page() {
        return "go/yard/list";
    }

}