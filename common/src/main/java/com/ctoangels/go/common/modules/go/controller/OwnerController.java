package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Owner 控制层
 *
 */
@Controller
@RequestMapping("owner")
public class OwnerController {
    @RequestMapping
    public String page() {
        return "go/owner/list";
    }

}