package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Shipyard 控制层
 *
 */
@Controller
@RequestMapping("shipyard")
public class ShipyardController {

    @RequestMapping
    public String page() {
        return "go/shipyard/info";
    }
}