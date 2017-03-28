package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.IRepairProgDetailService;
import com.ctoangels.go.common.modules.go.service.IReportDetailReqService;
import com.ctoangels.go.common.modules.go.service.IReportDetailService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * ReportDetail 控制层
 */
@Controller
@RequestMapping(value = "reportDetail")
public class ReportDetailController extends BaseController{

    @Autowired
    private IRepairProgDetailService repairProgDetailService;

    @Autowired
    private IReportDetailService reportDetailService;

    @Autowired
    private IReportDetailReqService reportDetailReqService;


    @RequestMapping(value = "recentDetail", method = RequestMethod.GET)
    public String recentDetail(@RequestParam Integer progDetailId, @RequestParam Integer taskId, ModelMap map) {
        RepairProgDetail progDetail=repairProgDetailService.selectById(progDetailId);

        List<ReportDetail> reportDetails=reportDetailService.getListByRepairProgDetailId(progDetailId);

        map.put("progDetail",progDetail);
        int size=reportDetails.size();
        map.put("size",size);
        map.put("reportDetails",reportDetails);
        map.put("taskId",taskId);

        return "go/reportDetail/recentDetail";
    }

    //获取repairModelDetailReq信息
    @RequestMapping(value = "/reqs", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject req(@RequestParam(required = false) Integer reportDetailId) {
        JSONObject jsonObject = new JSONObject();
        EntityWrapper<ReportDetailReq> ew = new EntityWrapper<>();
        ew.addFilter("report_detail_id={0}", reportDetailId);
        List<ReportDetailReq> reportReqs = reportDetailReqService.selectList(ew);
        jsonObject.put("reqs", reportReqs);

        return jsonObject;
    }
}