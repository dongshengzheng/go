package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Repairlist 控制层
 *
 */
@Controller
@RequestMapping("repairlist")
public class RepairlistController {
    @RequestMapping
    public String page() {
        return "go/repairlist/list";
    }

}