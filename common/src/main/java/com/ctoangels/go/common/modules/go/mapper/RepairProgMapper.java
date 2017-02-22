package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.RepairProg;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * RepairProg 表数据库控制层接口
 *
 */
public interface RepairProgMapper extends AutoMapper<RepairProg> {

    //根据id获取该工程总完成百分比
    Double getPerById(Integer repairProgId);

}