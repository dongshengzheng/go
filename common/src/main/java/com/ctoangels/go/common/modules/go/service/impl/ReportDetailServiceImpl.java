package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.ReportDetailMapper;
import com.ctoangels.go.common.modules.go.entity.ReportDetail;
import com.ctoangels.go.common.modules.go.service.IReportDetailService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * ReportDetail 表数据服务层接口实现类
 */
@Service
public class ReportDetailServiceImpl extends SuperServiceImpl<ReportDetailMapper, ReportDetail> implements IReportDetailService {
    @Autowired
    ReportDetailMapper reportDetailMapper;

    @Override
    public List<ReportDetail> getListByTaskId(Integer taskId) {
        return reportDetailMapper.getListByTaskId(taskId);
    }

    @Override
    public List<ReportDetail> getListByReportId(Integer reportId) {
        return reportDetailMapper.getListByReportId(reportId);
    }

    @Override
    public ReportDetail selectMaxReportDetailByProgDetailIdAndCreateTime(Integer repairProgDetailId) {
        return reportDetailMapper.selectMaxReportDetailByProgDetailIdAndCreateTime(repairProgDetailId);
    }
}