package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import com.ctoangels.go.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * RepairSpecDetail 控制层
 */
@Controller
@RequestMapping(value = "repairSpecDetail")
public class RepairSpecDetailController extends BaseController {
    @Autowired
    IRepairSpecDetailService repairSpecDetailService;

    @Autowired
    IRepairSpecDetailReqService repairSpecDetailReqService;

    @Autowired
    IDictService dictService;

    @Autowired
    IRepairModelDetailService repairModelDetailService;

    @Autowired
    IRepairModelDetailReqService repairModelDetailReqService;

    /*在新增工程单模式下 新增维修范本或维修详单*/
    @RequestMapping(value = "/addModelDetail", method = RequestMethod.GET)
    public String add(ModelMap map, @RequestParam(required = false) Integer id) {
        if (id != null && id != 0) {
            RepairModelDetail detail = repairModelDetailService.selectById(id);
            List<RepairModelDetailReq> reqList = repairModelDetailReqService.getListByDetailId(id);
            map.put("detail", detail);
            String repairPosition = detail.getRepairPosition();
            if (!StringUtils.isEmpty(repairPosition)) {
                String[] positionList = repairPosition.split(",");
                map.put("positionList", positionList);
            }
            String repairTech = detail.getRepairTech();
            if (!StringUtils.isEmpty(repairTech)) {
                String[] techList = repairTech.split(",");
                map.put("techList", techList);
            }
            map.put("reqList", reqList);
        }
        EntityWrapper<Dict> ew = new EntityWrapper<>();
        ew.addFilter("type={0}", "维修部位");
        List<Dict> repDicts = dictService.selectList(ew);
        EntityWrapper<Dict> ew1 = new EntityWrapper<>();
        ew1.addFilter("type={0}", "修理工艺");
        List<Dict> reqDicts = dictService.selectList(ew1);
        map.put("repDicts", repDicts);
        map.put("reqDicts", reqDicts);
        return "go/repairSpec/detail";
    }

    /*保存为维修工程单范本*/
    @RequestMapping(value = "/addModelDetail", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addModel(RepairModelDetail repairModelDetail, @RequestParam(required = false) String dataJson) {
        int companyId = getCurrentUser().getCompanyId();
        repairModelDetail.setCompanyId(companyId);
        JSONObject jsonObject = new JSONObject();
        List<RepairModelDetailReq> modelReqs = new ArrayList<>();
        RepairModelDetailReq modelReq = new RepairModelDetailReq();
        String[] array = dataJson.split(",");

        repairModelDetail.setDelFlag(Const.DEL_FLAG_NORMAL);

        if (repairModelDetailService.insert(repairModelDetail)) {
            int id = repairModelDetail.getId();
            for (int i = 0; i < array.length; i++) {
                if (i % 3 == 0) {
                    modelReq.setDes(array[i]);
                } else if (i % 3 == 1) {
                    modelReq.setUnit(array[i]);
                } else if (i % 3 == 2) {
                    modelReq.setCount(array[i]);
                    modelReq.setRepairModelDetailId(id);
                    modelReqs.add(modelReq);
                    modelReq = new RepairModelDetailReq();
                }
            }
            repairModelDetailReqService.insertBatch(modelReqs);

            jsonObject.put("success", true);
            jsonObject.put("specDetail", false);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }


    /*保存为工程单的维修详单*/
    @RequestMapping(value = "/addSpecDetail", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(RepairSpecDetail repairSpecDetail, @RequestParam(required = false) String dataJson) {
        JSONObject jsonObject = new JSONObject();
        List<RepairSpecDetailReq> reqs = new ArrayList<>();
        RepairSpecDetailReq req = new RepairSpecDetailReq();
        String[] array = dataJson.split(",");

        repairSpecDetail.setDelFlag(Const.DEL_FLAG_NORMAL);

        if (repairSpecDetailService.insert(repairSpecDetail)) {
            int id = repairSpecDetail.getId();
            for (int i = 0; i < array.length; i++) {
                if (i % 3 == 0) {
                    req.setDes(array[i]);
                } else if (i % 3 == 1) {
                    req.setUnit(array[i]);
                } else if (i % 3 == 2) {
                    req.setCount(array[i]);
                    req.setRepairSpecDetailId(id);
                    reqs.add(req);
                    req = new RepairSpecDetailReq();
                }
            }
            repairSpecDetailReqService.insertBatch(reqs);

            jsonObject.put("success", true);
            jsonObject.put("specDetail", true);
            jsonObject.put("repairSpecDetailId", id);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }

}