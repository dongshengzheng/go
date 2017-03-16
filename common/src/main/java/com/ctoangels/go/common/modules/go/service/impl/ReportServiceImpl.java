package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.ReportMapper;
import com.ctoangels.go.common.modules.go.entity.Report;
import com.ctoangels.go.common.modules.go.service.IReportService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Report 表数据服务层接口实现类
 *
 */
@Service
public class ReportServiceImpl extends SuperServiceImpl<ReportMapper, Report> implements IReportService {


}