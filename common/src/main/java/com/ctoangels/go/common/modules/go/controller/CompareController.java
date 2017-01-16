package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Compare 控制层
 *
 */
@Controller
@RequestMapping("compare")
public class CompareController {
    @RequestMapping
    public String page() {
        return "go/compare/list";
    }

}