package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairModelDetailReqMapper;
import com.ctoangels.go.common.modules.go.entity.RepairModelDetailReq;
import com.ctoangels.go.common.modules.go.service.IRepairModelDetailReqService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * RepairModelDetailReq 表数据服务层接口实现类
 *
 */
@Service
public class RepairModelDetailReqServiceImpl extends SuperServiceImpl<RepairModelDetailReqMapper, RepairModelDetailReq> implements IRepairModelDetailReqService {

    @Autowired
    private RepairModelDetailReqMapper repairModelDetailReqMapper;

    @Override
    public void deleteRepairModelDetailById(int repair_model_detail_id) {
        repairModelDetailReqMapper.deleteRepairModelDetailById(repair_model_detail_id);
    }
}