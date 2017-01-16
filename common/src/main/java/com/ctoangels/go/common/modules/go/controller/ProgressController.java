package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Progress 控制层
 *
 */
@Controller
@RequestMapping("progress")
public class ProgressController {
    @RequestMapping
    public String page() {
        return "go/progress/list";
    }

}