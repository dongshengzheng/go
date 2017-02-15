package com.ctoangels.go.common.modules.go.controller;

import com.ctoangels.go.common.modules.go.entity.RepairModelItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 *
 * Enquiry 控制层
 *
 */
@Controller
@RequestMapping("enquiry")
public class EnquiryController {

    @RequestMapping
    public String add() {
        return "go/repairSpec/detail";
    }

}