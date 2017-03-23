package com.ctoangels.go.common.modules.go.controller;

import com.ctoangels.go.common.modules.go.entity.Task;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * ReportDetail 控制层
 */
@Controller
@RequestMapping(value = "reportDetail")
public class ReportDetailController {

    @RequestMapping(value = "recentDetail", method = RequestMethod.GET)
    public String recentDetail(@RequestParam Integer progDetailId, @RequestParam Integer taskId, ModelMap map) {
        //根据progDetailId获取改detail的reportDetail
        return "go/reportDetail/recentDetail";
    }
}