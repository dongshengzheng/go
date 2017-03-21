package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        ew.setSqlSelect("id,publish_time,weather,temperature,hnmiaity");
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
    public String pages(@RequestParam(required = false) Integer id, Map map) {
        //根据进度详单的id
        RepairProgDetail progDetail = repairProgDetailService.selectById(id);

        map.put("progDetail", progDetail);
        return "go/report/record";
    }

    @RequestMapping(value = "/addRecord")
    @ResponseBody
    public JSONObject add(ReportDetail reportDetail,
                          @RequestParam(required = false) String fileName,
                          @RequestParam(required = false) String oss,
                          @RequestParam(required = false) Integer repairProgDetailId) {
        JSONObject jsonObject = new JSONObject();
        try {
            reportDetail.setRepairProgDetailId(repairProgDetailId);
            reportDetail.setOutSource(0);
            reportDetail.setSubmitStatus(0);
            reportDetail.setCreateDate(new Date());
            reportDetailService.insert(reportDetail);


            String[] fileNames = fileName.split(",");
            String[] osss = oss.split(",");

            List<MemoMedia> memoMedias = new ArrayList<>();
            for (int i = 0; i < fileNames.length; i++) {
                MemoMedia memoMedia = new MemoMedia();
                memoMedia.setType(fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()));
                memoMedia.setFilename(fileNames[i]);
                memoMedia.setOss(osss[i]);
                memoMedia.setReportDetailMemoId(reportDetail.getId());
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

}