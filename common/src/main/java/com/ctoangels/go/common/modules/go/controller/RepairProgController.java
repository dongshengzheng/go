package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.Company;
import com.ctoangels.go.common.modules.go.entity.ItemCount;
import com.ctoangels.go.common.modules.go.entity.RepairProg;
import com.ctoangels.go.common.modules.go.entity.RepairProgItem;
import com.ctoangels.go.common.modules.go.service.ICompanyService;
import com.ctoangels.go.common.modules.go.service.IRepairProgItemService;
import com.ctoangels.go.common.modules.go.service.IRepairProgService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * RepairProg 控制层
 */
@Controller
@RequestMapping("repairProg")
public class RepairProgController extends BaseController {
    @Autowired
    private IRepairProgService repairProgService;

    @Autowired
    private ICompanyService companyService;

    @Autowired
    private IRepairProgItemService repairProgItemService;

    @RequestMapping
    public String page() {
        return "go/repairProg/list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(RepairProg repairProg, @RequestParam(required = false) String keyword) {
        int companyId = getCurrentUser().getCompanyId();
        EntityWrapper<RepairProg> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.like("ship_name", keyword);
        ew.addFilter("company_id={0}", companyId);
        Page<RepairProg> page = repairProgService.selectPage(getPage(), ew);
        for (RepairProg prog : page.getRecords()) {
            prog.setPer(repairProgService.getPerById(prog.getId()));
        }
        return jsonPage(page);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add() {
        return "go/repairProg/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(RepairProg repairProg) {
        JSONObject jsonObject = new JSONObject();
        Company company = companyService.selectById(getCurrentUser().getCompanyId());
        repairProg.setCompanyId(company.getId());
        repairProg.setCompanyName(company.getName());
        repairProg.setDelFlag(Const.DEL_FLAG_NORMAL);
        if (repairProgService.insert(repairProg)) {
            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String info(@RequestParam(required = false) Integer id, ModelMap map) {
        RepairProg repairProg = repairProgService.selectById(id);
        List<RepairProgItem> type1 = repairProgItemService.getItemsContainDetailName(id, "通用服务");
        List<RepairProgItem> type2 = repairProgItemService.getItemsContainDetailName(id, "坞修工程");
        List<RepairProgItem> type3 = repairProgItemService.getItemsContainDetailName(id, "船体工程");
        List<RepairProgItem> type4 = repairProgItemService.getItemsContainDetailName(id, "机械工程");
        List<RepairProgItem> type5 = repairProgItemService.getItemsContainDetailName(id, "电气工程");
        List<RepairProgItem> type6 = repairProgItemService.getItemsContainDetailName(id, "冷藏工程");
        List<RepairProgItem> type7 = repairProgItemService.getItemsContainDetailName(id, "特种设备");
        List<RepairProgItem> type8 = repairProgItemService.getItemsContainDetailName(id, "其他");
        map.put("repairProg", repairProg);
        map.put("type1", type1);
        map.put("type2", type2);
        map.put("type3", type3);
        map.put("type4", type4);
        map.put("type5", type5);
        map.put("type6", type6);
        map.put("type7", type7);
        map.put("type8", type8);
        return "go/repairProg/info";
    }

    @RequestMapping(value = "/getCount", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject getCount(@RequestParam(required = false) Integer id) {
        JSONObject jo = new JSONObject();
        List<ItemCount> countList = repairProgItemService.getCount(id);
        jo.put(Const.DRAW, request.getParameter(Const.DRAW));
        jo.put(Const.RECORDSTOTAL, countList.size());
        jo.put(Const.RECORDSFILTERED, countList.size());
        jo.put(Const.NDATA, countList);
        return jo;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam(required = false) Integer id, ModelMap map) {
        RepairProg repairProg = repairProgService.selectById(id);
        map.put("repairProg", repairProg);
        return "go/repairProg/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editComplete(RepairProg repairProg) {
        JSONObject jsonObject = new JSONObject();
        if (repairProgService.updateById(repairProg)) {
            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "编辑时出错,请稍后再试");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject delete(@RequestParam(required = false) Integer id) {
        JSONObject jsonObject = new JSONObject();
        RepairProg repairProg = repairProgService.selectById(id);
        repairProg.setDelFlag(Const.DEL_FLAG_DELETE);
        if (repairProgService.updateById(repairProg)) {
            jsonObject.put("status", 1);
        } else {
            jsonObject.put("status", 0);
            jsonObject.put("msg", "删除错误,请稍后再试");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/item/changeStatus", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject itemChangeStatus(@RequestParam(required = false) Integer id, @RequestParam(required = false) Integer status) {
        JSONObject jsonObject = new JSONObject();
        RepairProgItem repairProgItem = repairProgItemService.selectById(id);
        repairProgItem.setTaskStatus(status);
        if (repairProgItemService.updateById(repairProgItem)) {
            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "更改状态错误,请稍后再试");
        }
        return jsonObject;
    }

}