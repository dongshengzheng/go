package com.ctoangels.go.common.modules.go.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.RepairProgDetail;
import com.ctoangels.go.common.modules.go.entity.ReportDetail;
import com.ctoangels.go.common.modules.go.entity.Task;
import com.ctoangels.go.common.modules.go.service.IRepairProgDetailService;
import com.ctoangels.go.common.modules.go.service.IReportDetailService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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


    @RequestMapping(value = "recentDetail", method = RequestMethod.GET)
    public String recentDetail(@RequestParam Integer progDetailId, @RequestParam Integer taskId, ModelMap map) {
        RepairProgDetail progDetail=repairProgDetailService.selectById(progDetailId);

        EntityWrapper<ReportDetail> ew =getEntityWrapper();
        ew.addFilter("repair_prog_detail_id={0}",progDetailId);
        List<ReportDetail> reportDetails=reportDetailService.selectList(ew);



        map.put("progDetail",progDetail);
        int size=reportDetails.size();
        map.put("size",size);
        map.put("reportDetails",reportDetails);


        return "go/reportDetail/recentDetail";
    }
}