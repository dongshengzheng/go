package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.IDictService;
import com.ctoangels.go.common.modules.go.service.IRepairSpecDetailService;
import com.ctoangels.go.common.modules.go.service.IRepairSpecService;
import com.ctoangels.go.common.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 *
 * Enquiry 控制层
 *
 */
@Controller
@RequestMapping("enquiry")
public class EnquiryController {

    @Autowired
    private IRepairSpecDetailService repairSpecDetailService;

    @Autowired
    private IDictService dictService;

    @RequestMapping
    public String add(ModelMap modelMap) {
        EntityWrapper<Dict> ew = new EntityWrapper<>();
        ew.addFilter("type={0}", "维修部位");
        List<Dict> repDicts=dictService.selectList(ew);

        EntityWrapper<Dict> ew1 = new EntityWrapper<>();
        ew1.addFilter("type={0}", "修理工艺");
        List<Dict> reqDicts=dictService.selectList(ew1);

        modelMap.put("repDicts",repDicts);
        modelMap.put("reqDicts",reqDicts);
        return "go/repairSpec/detail";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(RepairSpecDetail repairSpecDetail) {
        JSONObject jsonObject = new JSONObject();
        repairSpecDetail.setDelFlag(Const.DEL_FLAG_NORMAL);
        if (repairSpecDetailService.insert(repairSpecDetail)) {
            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }
}