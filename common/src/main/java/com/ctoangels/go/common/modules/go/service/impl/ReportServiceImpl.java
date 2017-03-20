package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.entity.ReportDetail;
import com.ctoangels.go.common.modules.go.mapper.ReportDetailMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.ReportMapper;
import com.ctoangels.go.common.modules.go.entity.Report;
import com.ctoangels.go.common.modules.go.service.IReportService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

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


    @Override
    public boolean saveReportAndUpdateReportDetail(Report report, Integer[] reportDetailId) {

        if (reportMapper.insert(report) < 0) {
            return false;
        }
        if (reportDetailId != null && reportDetailId.length > 0) {
            List<Integer> list = java.util.Arrays.asList(reportDetailId);
            List<ReportDetail> detailList = reportDetailMapper.selectBatchIds(list);
            for (ReportDetail detail : detailList) {
                //TODO:更改detail状态为已提交
            }
            if (reportDetailMapper.updateBatchById(detailList) > 0) {
                return false;
            }
        }
        return false;
    }
}