package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import com.ctoangels.go.common.util.MailUtil;
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
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Report 控制层
 */
@Controller
@RequestMapping(value = "report")
public class ReportController extends BaseController {
    @Autowired
    ITaskService taskService;

    @Autowired
    IDictService dictService;

    @Autowired
    IRepairProgDetailService repairProgDetailService;

    @Autowired
    IReportService reportService;

    @Autowired
    private IReportDetailService reportDetailService;


    @Autowired
    private IMemoMediaService memoMediaService;

    @Autowired
    private IRepairProgDetailReqService repairProgDetailReqService;

    @Autowired
    private IReportDetailReqService reportDetailReqService;


    @RequestMapping
    public String page(@RequestParam Integer taskId, ModelMap map) {
        Task task = taskService.selectById(taskId);
        map.put("task", task);
        return "go/report/list";
    }


    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) Integer taskId, @RequestParam(required = false) String keyword) {
        EntityWrapper<Report> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.like("ship_name", keyword);
        ew.setSqlSelect("id,publish_time,weather,temperature,humidity");
        ew.addFilter("task_id={0}", taskId);
        ew.orderBy("publish_time", false);
        Page<Report> page = reportService.selectPage(getPage(), ew);
        return jsonPage(page);
    }

    @RequestMapping(value = "/add")
    public String add(@RequestParam Integer taskId, ModelMap map) {
        Task task = taskService.selectById(taskId);
        map.put("task", task);
        return "go/report/add";
    }

    @RequestMapping(value = "/getReportDetail")
    @ResponseBody
    public JSONObject list(@RequestParam Integer taskId) {
        JSONObject jsonObject = new JSONObject();
        //根据taskId拿到所有未提交的reportDetail
        List<ReportDetail> list = reportDetailService.getListByTaskId(taskId);
        jsonObject.put("list", list);
        return jsonObject;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addComplete(Report report, Integer[] reportDetailId) {
        JSONObject jsonObject = new JSONObject();
        //TODO:1.保存report,2.更新reportDetail状态,3.发送每日报告邮件
        reportService.saveReportAndUpdateReportDetail(report, reportDetailId);//TODO:impl还未实现
//        MailUtil.sendReportEmail(report, reportDetailId);//TODO:具体详细还未实现
        Boolean flag = true;
        if (flag) {
            jsonObject.put("success", true);
        } else {
            jsonObject.put("msg", "出错");
            jsonObject.put("success", false);
        }
        return jsonObject;
    }


    //记录汇报
    @RequestMapping(value = "/addRecord",method = RequestMethod.GET)
    public String pages(@RequestParam(required = false) Integer id,@RequestParam(required = false) Integer taskId, Map map){
        //根据进度详单的id
        RepairProgDetail progDetail = repairProgDetailService.selectById(id);

        //查看未提交的报告单，则进入就会使编辑的状态
        EntityWrapper<ReportDetail> ew=getEntityWrapper();
        ew.addFilter("repair_prog_detail_id={0}",id);
        ew.addFilter("submit_status",Const.REPORT_DETAIL_SUBMIT_NOT);
        ReportDetail reportDetail=reportDetailService.selectOne(ew);
        if(reportDetail!=null){
            EntityWrapper<MemoMedia> ew1=new EntityWrapper<>();
            ew1.addFilter("report_detail_id={0}",reportDetail.getId());
            List<MemoMedia>reportDetailFiles= memoMediaService.selectList(ew1);
            map.put("reportDetailFiles",reportDetailFiles);

        }

        map.put("progDetail", progDetail);
        map.put("reportDetail",reportDetail);
        map.put("taskId",taskId);
        return "go/report/record";
    }

    @RequestMapping(value = "/addRecord")
    @ResponseBody
    public JSONObject add(ReportDetail reportDetail,
                          @RequestParam(required = false) String fileName,
                          @RequestParam(required = false) String oss,
                          @RequestParam(required = false) String fileType,
                          @RequestParam(required = false) Integer repairProgDetailId) {
        JSONObject jsonObject = new JSONObject();
        try {
            reportDetail.setRepairProgDetailId(repairProgDetailId);
            reportDetail.setOutSource(0);
            reportDetail.setSubmitStatus(Const.REPORT_DETAIL_SUBMIT_NOT);//报告详单未提交
            reportDetail.setTaskStatus(Const.TASK_NOT_START);//项目未开始
            reportDetail.setDelFlag(Const.DEL_FLAG_NORMAL);//表示正常
            reportDetail.setCreateDate(new Date());
            reportDetailService.insert(reportDetail);


            String[] fileNames = fileName.split(",");
            String[] osss = oss.split(",");
            String[] fileTypes=fileType.split(",");

            List<MemoMedia> memoMedias = new ArrayList<>();
            for (int i = 0; i < fileNames.length; i++) {
                MemoMedia memoMedia = new MemoMedia();
                memoMedia.setFilename(fileNames[i]);
                memoMedia.setOss(osss[i]);
                memoMedia.setType(fileTypes[i]);
                memoMedia.setReportDetailId(reportDetail.getId());
                memoMedias.add(memoMedia);
            }
            memoMediaService.insertBatch(memoMedias);

            jsonObject.put("success", true);
        } catch (Exception e) {
            jsonObject.put("success", false);
            e.printStackTrace();
        }


        return jsonObject;
    }

    //获取repairModelDetailReq信息
    @RequestMapping(value = "/reqs", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject demo(@RequestParam(required = false) Integer ProgDetailId,@RequestParam(required = false) Integer reportDetailId) {
        JSONObject jsonObject = new JSONObject();
        EntityWrapper<ReportDetailReq> ew=new EntityWrapper<>();
        ew.addFilter("report_detail_id={0}",reportDetailId);
        List<ReportDetailReq> reportReqs=reportDetailReqService.selectList(ew);

        if(reportReqs!=null){
            EntityWrapper<RepairProgDetailReq> ew1 = new EntityWrapper<>();
            ew1.addFilter("repair_prog_detail_id={0}", ProgDetailId);
            List<RepairProgDetailReq> repairProgDetailReqs = repairProgDetailReqService.selectList(ew1);
            jsonObject.put("reqs", repairProgDetailReqs);
        }



        /*EntityWrapper<ReportDetail> ew=getEntityWrapper();
        ew.addFilter("repair_prog_detail_id={0}",id);
        List<ReportDetail> reportDetails=reportDetailService.selectList(ew);
        if(reportDetails.size()<=0){
            EntityWrapper<RepairProgDetailReq> ew2=new EntityWrapper<>();
            ew2.addFilter("repair_prog_detail_id={0}",progDetail.getId());
            List<RepairProgDetailReq> progDetailReqs=repairProgDetailReqService.selectList(ew2);
            if(progDetailReqs.size()>0){
                List<ReportDetailReq>reportDetailReqs  = new ArrayList<>();
                for (RepairProgDetailReq req : progDetailReqs) {
                    ReportDetailReq reportDetailReq=new ReportDetailReq();
                    BeanUtils.copyProperties(reportDetailReq, req);
                    reportDetailReq.setId(null);
                    repairProgDetailReq.setRepairProgDetailId(repairProgDetail.getId());
                    progReqs.add(repairProgDetailReq);
                }
                repairProgDetailReqService.insertBatch(progReqs);
            }


            BeanUtils.copyProperties(repairProg, repairSpec);
        }*/



        return jsonObject;
    }

}