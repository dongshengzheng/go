package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.RepairSpecDetailReq;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 * RepairSpecDetailReq 表数据库控制层接口
 */
public interface RepairSpecDetailReqMapper extends AutoMapper<RepairSpecDetailReq> {

    void deleteRepairSpecDetailReqById(Integer repairSpecDetailId);
}