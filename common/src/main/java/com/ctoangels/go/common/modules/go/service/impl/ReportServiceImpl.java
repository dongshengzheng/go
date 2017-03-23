package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.entity.ReportDetail;
import com.ctoangels.go.common.modules.go.entity.TaskEmail;
import com.ctoangels.go.common.modules.go.mapper.ReportDetailMapper;
import com.ctoangels.go.common.modules.go.service.ITaskEmailService;
import com.ctoangels.go.common.util.Const;
import com.ctoangels.go.common.util.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.ReportMapper;
import com.ctoangels.go.common.modules.go.entity.Report;
import com.ctoangels.go.common.modules.go.service.IReportService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.ArrayList;
import java.util.List;

/**
 * Report 表数据服务层接口实现类
 */
@Service
public class ReportServiceImpl extends SuperServiceImpl<ReportMapper, Report> implements IReportService {

    @Autowired
    ReportMapper reportMapper;

    @Autowired
    ReportDetailMapper reportDetailMapper;

    @Autowired
    ITaskEmailService taskEmailService;


    @Override
    public boolean saveReportAndUpdateReportDetail(Report report, Integer[] reportDetailId) {

        if (reportMapper.insert(report) < 0) {
            return false;
        }
        if (reportDetailId != null && reportDetailId.length > 0) {
            List<Integer> list = java.util.Arrays.asList(reportDetailId);
            List<ReportDetail> detailList = reportDetailMapper.selectBatchIds(list);
            Integer reportId = report.getId();
            for (ReportDetail detail : detailList) {
                detail.setSubmitStatus(Const.REPORT_DETAIL_SUBMIT_HAVE);
                detail.setReportId(reportId);
            }
            if (reportDetailMapper.updateBatchById(detailList) < 0) {
                return false;
            }
        }
        List<ReportDetail> reportDetailList = reportDetailMapper.getListByReportId(report.getId());
        List<TaskEmail> emailList = taskEmailService.getEmailList(report.getTaskId());
        String[] emails = null;
        if (emailList != null && emailList.size() > 0) {
            emails = new String[emailList.size()];
            for (int i = 0; i < emailList.size(); i++) {
                emails[i] = emailList.get(i).getEmail();
            }
        }
        MailUtil.sendReportEmail(report, reportDetailList, emails);
        return true;
    }
}