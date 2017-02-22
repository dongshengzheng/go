package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairProgMapper;
import com.ctoangels.go.common.modules.go.entity.RepairProg;
import com.ctoangels.go.common.modules.go.service.IRepairProgService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 * RepairProg 表数据服务层接口实现类
 */
@Service
public class RepairProgServiceImpl extends SuperServiceImpl<RepairProgMapper, RepairProg> implements IRepairProgService {

    @Autowired
    RepairProgMapper repairProgMapper;

    @Override
    public Double getPerById(Integer repairProgId) {
        return repairProgMapper.getPerById(repairProgId);
    }
}