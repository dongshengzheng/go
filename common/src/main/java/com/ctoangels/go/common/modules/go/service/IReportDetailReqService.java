package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.ReportDetailReq;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * ReportDetailReq 表数据服务层接口
 *
 */
public interface IReportDetailReqService extends ISuperService<ReportDetailReq> {

Boolean deletebyReportDetailId(Integer reportDetailId);
}