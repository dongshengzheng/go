package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.RepairModelDetailReq;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * RepairModelDetailReq 表数据库控制层接口
 *
 */
public interface RepairModelDetailReqMapper extends AutoMapper<RepairModelDetailReq> {

    void deleteRepairModelDetailById(int id);

}