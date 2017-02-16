package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairSpecItemMapper;
import com.ctoangels.go.common.modules.go.entity.RepairSpecItem;
import com.ctoangels.go.common.modules.go.service.IRepairSpecItemService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * RepairSpecItem 表数据服务层接口实现类
 */
@Service
public class RepairSpecItemServiceImpl extends SuperServiceImpl<RepairSpecItemMapper, RepairSpecItem> implements IRepairSpecItemService {
    @Autowired
    RepairSpecItemMapper repairSpecItemMapper;

    @Override
    public List<RepairSpecItem> bySpecIdAndCatagoryContainParams(Integer repairSpecId, String catagory, Integer modelId) {
        return repairSpecItemMapper.bySpecIdAndCatagoryContainParams(repairSpecId, catagory, modelId);
    }
}