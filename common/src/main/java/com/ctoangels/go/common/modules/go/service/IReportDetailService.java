package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.ReportDetail;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * ReportDetail 表数据服务层接口
 */
public interface IReportDetailService extends ISuperService<ReportDetail> {

    List<ReportDetail> getListByTaskId(Integer taskId);

    List<ReportDetail> getListByReportId(Integer reportId);

    ReportDetail selectMaxReportDetailByProgDetailIdAndCreateTime(Integer repairProgDetailId);
}