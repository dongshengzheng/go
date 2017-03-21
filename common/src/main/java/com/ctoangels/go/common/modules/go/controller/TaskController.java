package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Task 控制层
 */
@Controller
@RequestMapping(value = "task")
public class TaskController extends BaseController {

    @Autowired
    ITaskService taskService;

    @Autowired
    IDictService dictService;

    @Autowired
    IRepairProgDetailService repairProgDetailService;

    @RequestMapping
    public String page() {
        return "go/task/list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String keyword) {
        Integer companyId = getCurrentUser().getCompanyId();
        EntityWrapper<Task> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.like("ship_name", keyword);
        ew.setSqlSelect("id,ship_name,status,shipyard");
        ew.addFilter("company_id={0}", companyId);
        ew.orderBy("update_date", false);
        Page<Task> page = taskService.selectPage(getPage(), ew);
        return jsonPage(page);
    }


    @RequestMapping(value = "/info")
    public String info(@RequestParam Integer id, ModelMap map) {
        List<Dict> cataList = dictService.getListByType("维修工程大类");
        Task task = taskService.selectById(id);
        map.put("task", task);
        map.put("cataList", cataList);
        return "go/task/info";
    }

    @RequestMapping(value = "/detailList")
    @ResponseBody
    public JSONObject detailList(RepairProgDetail detail) {
        JSONObject jsonObject = new JSONObject();
        EntityWrapper<RepairProgDetail> ew = getEntityWrapper();
        ew.setEntity(detail);
        ew.setSqlSelect("id,pro_order_no,pro_name,pro_desc,task_status");
        List<RepairProgDetail> detailList = repairProgDetailService.selectList(ew);
        jsonObject.put("detailList", detailList);
        return jsonObject;
    }

}