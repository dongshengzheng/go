package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.ReportDetailReqMapper;
import com.ctoangels.go.common.modules.go.entity.ReportDetailReq;
import com.ctoangels.go.common.modules.go.service.IReportDetailReqService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * ReportDetailReq 表数据服务层接口实现类
 *
 */
@Service
public class ReportDetailReqServiceImpl extends SuperServiceImpl<ReportDetailReqMapper, ReportDetailReq> implements IReportDetailReqService {

    @Autowired
    private ReportDetailReqMapper reportDetailReqMapper;

    @Override
    public Boolean deletebyReportDetailId(Integer reportDetailId) {
        return reportDetailReqMapper.deletebyReportDetailId(reportDetailId);
    }
}