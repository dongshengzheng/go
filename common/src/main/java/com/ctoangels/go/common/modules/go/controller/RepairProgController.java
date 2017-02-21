package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.Company;
import com.ctoangels.go.common.modules.go.entity.RepairProg;
import com.ctoangels.go.common.modules.go.service.ICompanyService;
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
        map.put("repairProg", repairProg);
        return "go/repairProg/info";
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

}