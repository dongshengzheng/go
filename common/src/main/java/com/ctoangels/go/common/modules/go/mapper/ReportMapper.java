package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.Report;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * Report 表数据库控制层接口
 *
 */
public interface ReportMapper extends AutoMapper<Report> {


    Report getLatestReport(Integer taskId);


}