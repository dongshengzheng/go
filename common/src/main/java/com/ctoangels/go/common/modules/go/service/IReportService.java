package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.Report;
import com.baomidou.framework.service.ISuperService;

/**
 * Report 表数据服务层接口
 */
public interface IReportService extends ISuperService<Report> {

    boolean saveReportAndUpdateReportDetail(Report report, Integer[] reportDetailId);

}