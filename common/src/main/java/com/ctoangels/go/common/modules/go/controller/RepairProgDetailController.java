package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.RepairProgDetail;
import com.ctoangels.go.common.modules.go.service.IRepairProgDetailService;
import com.ctoangels.go.common.modules.go.service.ITaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * RepairProgDetail 控制层
 */
@Controller
@RequestMapping(value = "repairProgDetail")
public class RepairProgDetailController {

    @Autowired
    IRepairProgDetailService repairProgDetailService;


    @RequestMapping(value = "/addNew")
    @ResponseBody
    public JSONObject detailList(RepairProgDetail detail) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", repairProgDetailService.insert(detail));
        jsonObject.put("id", detail.getId());
        return jsonObject;
    }
}