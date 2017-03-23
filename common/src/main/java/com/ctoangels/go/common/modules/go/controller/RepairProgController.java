package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * RepairProg 控制层
 */
@Controller
@RequestMapping("repairProg")
public class RepairProgController extends BaseController {
    @Autowired
    private IRepairSpecService repairSpecService;

    @Autowired
    private IRepairSpecItemService repairSpecItemService;

    @Autowired
    private IRepairSpecDetailService repairSpecDetailService;

    @Autowired
    private IRepairSpecDetailReqService repairSpecDetailReqService;

    @Autowired
    private IRepairProgService repairProgService;

    @Autowired
    private ICompanyService companyService;

    @Autowired
    private IRepairProgDetailService repairProgDetailService;

    @Autowired
    private IRepairProgDetailReqService repairProgDetailReqService;

    @Autowired
    private IDictService dictService;

    @Autowired
    private ITaskService taskService;

    @Autowired
    private ITaskEmailService taskEmailService;

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
        ew.setSqlSelect("id,ship_name,order_no,type,plan_start_date,plan_days,plan_cost,create_date,create_by");
        ew.addFilter("company_id={0}", companyId);
        Page<RepairProg> page = repairProgService.selectPage(getPage(), ew);
        for (RepairProg prog : page.getRecords()) {
            prog.setPer(repairProgService.getPerById(prog.getId()));
/*
            prog.setType(dictService.getDesByTypeAndValue("维修类型", prog.getType()));
*/
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
        List<RepairProgDetail> type1 = repairProgDetailService.getDetailByCatagory(id, "通用服务");
        List<RepairProgDetail> type2 = repairProgDetailService.getDetailByCatagory(id, "坞修工程");
        List<RepairProgDetail> type3 = repairProgDetailService.getDetailByCatagory(id, "船体工程");
        List<RepairProgDetail> type4 = repairProgDetailService.getDetailByCatagory(id, "机械工程");
        List<RepairProgDetail> type5 = repairProgDetailService.getDetailByCatagory(id, "电气工程");
        List<RepairProgDetail> type6 = repairProgDetailService.getDetailByCatagory(id, "冷藏工程");
        List<RepairProgDetail> type7 = repairProgDetailService.getDetailByCatagory(id, "特种设备");
        List<RepairProgDetail> type8 = repairProgDetailService.getDetailByCatagory(id, "其他");
        List<Dict> cataList = dictService.getListByType("维修工程大类");
        map.put("repairProg", repairProg);
        map.put("cataList", cataList);
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
        List<ItemCount> countList = repairProgDetailService.getCount(id);
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
        RepairProgDetail repairProgDetail = repairProgDetailService.selectById(id);
        repairProgDetail.setTaskStatus(status);
        if (repairProgDetailService.updateById(repairProgDetail)) {
            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "更改状态错误,请稍后再试");
        }
        return jsonObject;
    }

    //生成维修进度
    @RequestMapping(value = "makeProgress", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject makeProg(@RequestParam(required = false) Integer id, @RequestParam(required = false) String shipyardName, @RequestParam(required = false) String dataJson) throws InvocationTargetException, IllegalAccessException {
        JSONObject jsonObject = new JSONObject();
        try {
            //查找维修工程单基本信息
            RepairSpec repairSpec = repairSpecService.selectById(id);
            RepairProg repairProg = new RepairProg();
            BeanUtils.copyProperties(repairProg, repairSpec);
            repairProg.setId(null);
            repairProgService.insert(repairProg);

            //查找维修详单的item信息
        /*EntityWrapper<RepairSpecItem> ew=new EntityWrapper<>();
        ew.addFilter("repair_spec_id={0}",id);
        List<RepairSpecItem> repairSpecItems=repairSpecItemService.selectList(ew);
        List<RepairProgItem> repairProgItems=new ArrayList<>();

        for(RepairSpecItem r:repairSpecItems){
            RepairProgItem repairProgItem=new RepairProgItem();
            BeanUtils.copyProperties(repairProgItem,r);
            repairProgItem.setId(null);
            repairProgItem.setRepairProgId(repairProg.getId());
            repairProgItems.add(repairProgItem);
        }
        repairProgItemService.insertBatch(repairProgItems);*/


            //查找维修详单的detail信息
            EntityWrapper<RepairSpecDetail> ew2 = new EntityWrapper<>();
            ew2.addFilter("repair_spec_id={0}", id);
            List<RepairSpecDetail> repairSpecDetails = repairSpecDetailService.selectList(ew2);
            if (repairSpecDetails.size() > 0) {
                for (RepairSpecDetail r : repairSpecDetails) {
                    RepairProgDetail repairProgDetail = new RepairProgDetail();
                    BeanUtils.copyProperties(repairProgDetail, r);
                    repairProgDetail.setId(null);
                    repairProgDetail.setRepairProgId(repairProg.getId());

                    repairProgDetailService.insert(repairProgDetail);


                    //查找每个详单的req信息
                    EntityWrapper<RepairSpecDetailReq> ew3 = new EntityWrapper<>();
                    ew3.addFilter("repair_spec_detail_id={0}", r.getId());
                    List<RepairSpecDetailReq> specReqs = repairSpecDetailReqService.selectList(ew3);
                    if (specReqs.size() > 0) {
                        List<RepairProgDetailReq> progReqs = new ArrayList<>();
                        for (RepairSpecDetailReq req : specReqs) {
                            RepairProgDetailReq repairProgDetailReq = new RepairProgDetailReq();
                            BeanUtils.copyProperties(repairProgDetailReq, req);
                            repairProgDetailReq.setId(null);
                            repairProgDetailReq.setRepairProgDetailId(repairProgDetail.getId());
                            progReqs.add(repairProgDetailReq);
                        }
                        repairProgDetailReqService.insertBatch(progReqs);
                    }
                }


            }
            Task task = new Task();
            task.setRepairProgId(repairProg.getId());
            task.setCompanyId(getCurrentUser().getCompanyId());
            task.setShipName(repairProg.getShipName());
            task.setShipyard(shipyardName);
            task.setStatus(2);
            taskService.insert(task);

            List<TaskEmail> emails = JSONObject.parseArray(dataJson, TaskEmail.class);
            for (TaskEmail e : emails) {
                e.setTaskId(task.getId());
            }
            taskEmailService.insertBatch(emails);
            jsonObject.put("mes", true);
        } catch (Exception e) {
            jsonObject.put("mes", false);
        }

        return jsonObject;
    }

    @RequestMapping(value = "progDetail", method = RequestMethod.GET)
    public String progDetail(@RequestParam(required = false) Integer id, Map map) {
        RepairProgDetail progDetail = repairProgDetailService.selectById(id);
        String repairPosition = progDetail.getRepairPosition();
        if (repairPosition != null) {
            String[] positions = repairPosition.split(",");
            map.put("positions", positions);
        }
        String repairTech = progDetail.getRepairTech();
        if (repairTech != null) {
            String[] techs = repairTech.split(",");
            map.put("techs", techs);
        }

        EntityWrapper<Dict> ew1 = new EntityWrapper<>();
        ew1.addFilter("type={0}", "维修部位");
        List<Dict> repDicts = dictService.selectList(ew1);

        EntityWrapper<Dict> ew2 = new EntityWrapper<>();
        ew2.addFilter("type={0}", "修理工艺");
        List<Dict> reqDicts = dictService.selectList(ew2);

        map.put("repDicts", repDicts);
        map.put("reqDicts", reqDicts);

        map.put("proDetail", progDetail);
        return "go/repairProg/detail";

    }

    //获取repairModelDetailReq信息
    @RequestMapping(value = "/reqs", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject demo(@RequestParam(required = false) Integer id) {
        JSONObject jsonObject = new JSONObject();
        EntityWrapper<RepairProgDetailReq> ew = new EntityWrapper<>();
        ew.addFilter("repair_prog_detail_id={0}", id);
        List<RepairProgDetailReq> repairProgDetailReqs = repairProgDetailReqService.selectList(ew);
        jsonObject.put("reqs", repairProgDetailReqs);
        return jsonObject;
    }

}