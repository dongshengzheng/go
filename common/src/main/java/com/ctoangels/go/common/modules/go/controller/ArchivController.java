package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Archiv 控制层
 *
 */
@Controller
@RequestMapping("archiv")
public class ArchivController {
    @RequestMapping
    public String page() {
        return "go/archiv/list";
    }

}