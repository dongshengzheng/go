package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.ReportDetail;
import com.baomidou.mybatisplus.mapper.AutoMapper;

import java.util.List;

/**
 * ReportDetail 表数据库控制层接口
 */
public interface ReportDetailMapper extends AutoMapper<ReportDetail> {

    List<ReportDetail> getListByTaskId(Integer taskId);
}