package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.RepairSpecDetailMedia;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * RepairSpecDetailMedia 表数据库控制层接口
 *
 */
public interface RepairSpecDetailMediaMapper extends AutoMapper<RepairSpecDetailMedia> {


    boolean deleteBySpecDetailId(Integer repairSpecDetailId);
}