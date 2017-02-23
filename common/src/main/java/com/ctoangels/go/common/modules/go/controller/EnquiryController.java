package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * Enquiry 控制层
 *
 */
@Controller
@RequestMapping("enquiry")
public class EnquiryController extends BaseController {

    @Autowired
    private IRepairSpecDetailReqService repairSpecDetailReqService;

    @Autowired
    private IRepairSpecDetailService repairSpecDetailService;

    @Autowired
    private IDictService dictService;

    @Autowired
    private IRepairModelDetailService repairModelDetailService;

    @Autowired
    private IRepairModelDetailReqService repairModelDetailReqService;

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

    /*保存为工程单的维修详单*/
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(RepairSpecDetail repairSpecDetail,@RequestParam(required = false) String dataJson) {
        JSONObject jsonObject = new JSONObject();
        List<RepairSpecDetailReq> reqs = new ArrayList<>();
        RepairSpecDetailReq req=new RepairSpecDetailReq();
        String[] array=dataJson.split(",");

        repairSpecDetail.setDelFlag(Const.DEL_FLAG_NORMAL);

        if (repairSpecDetailService.insert(repairSpecDetail)) {
            int id=repairSpecDetail.getId();
            for (int i=0;i<array.length;i++){
                if(i%3==0){
                    req.setDes(array[i]);
                }else if(i%3==1){
                    req.setUnit(array[i]);
                }else if(i%3==2){
                    req.setCount(array[i]);
                    req.setRepairSpecDetailId(id);
                    reqs.add(req);
                    req=new RepairSpecDetailReq();
                }
            }
            repairSpecDetailReqService.insertBatch(reqs);

            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }

    /*保存为维修工程单范本*/
    @RequestMapping(value = "/addModel", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addModel(RepairModelDetail repairModelDetail,@RequestParam(required = false) String dataJson) {
        int companyId = getCurrentUser().getCompanyId();
        repairModelDetail.setCompanyId(companyId);

        JSONObject jsonObject = new JSONObject();
        List<RepairModelDetailReq> modelReqs = new ArrayList<>();
        RepairModelDetailReq modelReq=new RepairModelDetailReq();
        String[] array=dataJson.split(",");

        repairModelDetail.setDelFlag(Const.DEL_FLAG_NORMAL);

        if (repairModelDetailService.insert(repairModelDetail)) {
            int id=repairModelDetail.getId();
            for (int i=0;i<array.length;i++){
                if(i%3==0){
                    modelReq.setDes(array[i]);
                }else if(i%3==1){
                    modelReq.setUnit(array[i]);
                }else if(i%3==2){
                    modelReq.setCount(array[i]);
                    modelReq.setRepairModelDetailId(id);
                    modelReqs.add(modelReq);
                    modelReq=new RepairModelDetailReq();
                }
            }
            repairModelDetailReqService.insertBatch(modelReqs);

            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }
}