package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairSpecDetailMediaMapper;
import com.ctoangels.go.common.modules.go.entity.RepairSpecDetailMedia;
import com.ctoangels.go.common.modules.go.service.IRepairSpecDetailMediaService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * RepairSpecDetailMedia 表数据服务层接口实现类
 *
 */
@Service
public class RepairSpecDetailMediaServiceImpl extends SuperServiceImpl<RepairSpecDetailMediaMapper, RepairSpecDetailMedia> implements IRepairSpecDetailMediaService {

    @Autowired
    private RepairSpecDetailMediaMapper repairSpecDetailMediaMapper;

    @Override
    public boolean deleteBySpecDetailId(Integer repairSpecDetailId) {
        return repairSpecDetailMediaMapper.deleteBySpecDetailId(repairSpecDetailId);
    }
}