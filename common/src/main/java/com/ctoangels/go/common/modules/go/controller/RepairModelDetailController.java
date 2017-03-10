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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * RepairModelDetail 控制层
 */
@Controller
@RequestMapping("modelDetail")
public class RepairModelDetailController extends BaseController {

    @Autowired
    private IRepairSpecDetailReqService repairSpecDetailReqService;

    @Autowired
    private IRepairSpecDetailService repairSpecDetailService;

    @Autowired
    private IDictService dictService;


    @Autowired
    private IRepairModelDetailReqService repairModelDetailReqService;


    @Autowired
    private IRepairModelDetailService repairModelDetailService;

    @RequestMapping
    public String page() {
        EntityWrapper<Dict> ew = new EntityWrapper<>();
        ew.addFilter("type={0}", "维修部位");
        List<Dict> repDicts = dictService.selectList(ew);

        EntityWrapper<Dict> ew1 = new EntityWrapper<>();
        ew1.addFilter("type={0}", "修理工艺");
        List<Dict> reqDicts = dictService.selectList(ew1);

        session.setAttribute("repDicts",repDicts);
        session.setAttribute("reqDicts",reqDicts);

        return "go/modelDetail/list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(RepairModelDetail repairModelDetail, @RequestParam(required = false) String keyword) {
        int companyId = getCurrentUser().getCompanyId();
        EntityWrapper<RepairModelDetail> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.like("pro_name", keyword);
        ew.addFilter("company_id={0}", companyId);
        Page<RepairModelDetail> page = repairModelDetailService.selectPage(getPage(), ew);
        return jsonPage(page);
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(HttpSession session) {

        return "go/modelDetail/add";
    }

    //获取repairModelDetailReq信息
    @RequestMapping(value = "/reqs", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject demo(@RequestParam(required =false) Integer id) {
        JSONObject jsonObject = new JSONObject();
        EntityWrapper<RepairModelDetailReq> ew = new EntityWrapper<>();
        ew.addFilter("repair_model_detail_id={0}", id);
        List<RepairModelDetailReq> repairModelDetailReqs=repairModelDetailReqService.selectList(ew);
        jsonObject.put("reqs",repairModelDetailReqs);
        return jsonObject;
    }

    /*保存为维修工程单范本*/
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addModel(RepairModelDetail repairModelDetail, @RequestParam(required = false) String dataJson) {
        repairModelDetail.setCompanyId(getCurrentUser().getCompanyId());

        List<RepairModelDetailReq>reqs=JSONObject.parseArray(dataJson,RepairModelDetailReq.class);
        JSONObject jsonObject = new JSONObject();
        repairModelDetail.setDelFlag(Const.DEL_FLAG_NORMAL);
        try{
            repairModelDetailService.insertDetailAndDetailReq(repairModelDetail,reqs);
            jsonObject.put("success", true);
        }catch (Exception e){
            jsonObject.put("success", false);
        }

        /*if () {
            if(reqs.size()>0) {

                for (RepairModelDetailReq r : reqs) {
                    r.setRepairModelDetailId(repairModelDetail.getId());
                }
                repairModelDetailReqService.insertBatch(reqs);
            }
            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }*/
        return jsonObject;
    }

    //查看和编辑
    @RequestMapping(value = "info" ,method =RequestMethod.GET)
    public String info(@RequestParam Integer id,@RequestParam String operate , ModelMap modelMap){

        RepairModelDetail repairModelDetail=repairModelDetailService.selectById(id);
        String repairPosition=repairModelDetail.getRepairPosition();
        if(repairPosition!=null){
            String[] positions=repairPosition.split(",");
            modelMap.put("positions",positions);
        }
        String repairTech=repairModelDetail.getRepairTech();
        if(repairTech!=null){
            String[] techs=repairTech.split(",");
            modelMap.put("techs",techs);
        }
        modelMap.put("modelDetails",repairModelDetail);

        EntityWrapper<RepairModelDetailReq> ew = new EntityWrapper<>();
        ew.addFilter("repair_model_detail_id={0}", repairModelDetail.getId());
        List<RepairModelDetailReq> repairModelDetailReqs=repairModelDetailReqService.selectList(ew);
        modelMap.put("detailReqs",repairModelDetailReqs);

        if(operate.equals("look")){
            return "go/modelDetail/info";
        }else{
            return "go/modelDetail/edit";
        }

    }


    /*更新为维修工程单范本*/
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editModel(RepairModelDetail repairModelDetail, @RequestParam(required = false) String dataJson) {
        JSONObject jsonObject = new JSONObject();
        List<RepairModelDetailReq> reqs=JSONObject.parseArray(dataJson,RepairModelDetailReq.class);
        repairModelDetail.setDelFlag(Const.DEL_FLAG_NORMAL);

        if (repairModelDetailService.insertOrUpdate(repairModelDetail)) {
            if(reqs.size()>0) {
                for (RepairModelDetailReq r : reqs) {
                    r.setRepairModelDetailId(repairModelDetail.getId());
                }
                repairModelDetailReqService.deleteRepairModelDetailById(repairModelDetail.getId());
                repairModelDetailReqService.insertBatch(reqs);
            }

            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }

    /*删除维修范本单*/
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject delete(@RequestParam Integer id){
        JSONObject jsonObject = new JSONObject();

        RepairModelDetail repairModelDetail= repairModelDetailService.selectById(id);
        repairModelDetail.setDelFlag(Const.DEL_FLAG_DELETE);
        if(repairModelDetailService.updateById(repairModelDetail)){
            jsonObject.put("status", 1);
        } else {
            jsonObject.put("status", 0);
            jsonObject.put("msg", "删除错误,请稍后再试");
        }
        return jsonObject;
    }
}