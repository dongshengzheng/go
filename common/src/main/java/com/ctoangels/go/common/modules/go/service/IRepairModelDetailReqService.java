package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.RepairModelDetailReq;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * RepairModelDetailReq 表数据服务层接口
 */
public interface IRepairModelDetailReqService extends ISuperService<RepairModelDetailReq> {

    void deleteRepairModelDetailById(int repair_model_detail_id);

    List<RepairModelDetailReq> getListByDetailId(Integer repairModelDetailId);
}