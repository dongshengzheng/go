package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.DetailNextProNo;
import com.ctoangels.go.common.modules.go.entity.RepairSpecDetail;
import com.baomidou.mybatisplus.mapper.AutoMapper;

import java.util.List;

/**
 * RepairSpecDetail 表数据库控制层接口
 */
public interface RepairSpecDetailMapper extends AutoMapper<RepairSpecDetail> {

    DetailNextProNo getNextProNo(Integer specId);
}