package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.ReportDetailStatus;
import com.baomidou.mybatisplus.mapper.AutoMapper;

import java.util.List;

/**
 * ReportDetailStatus 表数据库控制层接口
 */
public interface ReportDetailStatusMapper extends AutoMapper<ReportDetailStatus> {

    List<ReportDetailStatus> getByReportDetailIds(List<Integer> ids);


}