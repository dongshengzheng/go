package com.ctoangels.go.common.modules.go.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Task 控制层
 *
 */
@Controller
@RequestMapping("task")
public class TaskController {

    @RequestMapping
    public String record(){
        return "go/task/record";
    }
}