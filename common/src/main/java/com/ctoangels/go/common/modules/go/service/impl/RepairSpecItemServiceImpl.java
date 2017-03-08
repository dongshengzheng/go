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
    public List<RepairSpecItem> bySpecIdAndCatagoryWithParamsNoValue(Integer repairSpecId, String catagory, Integer modelId) {
        return repairSpecItemMapper.bySpecIdAndCatagoryWithParamsNoValue(repairSpecId, catagory, modelId);
    }

    @Override
    public List<RepairSpecItem> bySpecIdAndCatagoryWithParamsAndValue(Integer repairSpecId, String catagory, Integer modelId) {
        return repairSpecItemMapper.bySpecIdAndCatagoryWithParamsAndValue(repairSpecId, catagory, modelId);
    }

    @Override
    public List<RepairSpecItem> bySpecIdAndCatagoryForInfo(Integer repairSpecId, String catagory, Integer modelId) {
        return repairSpecItemMapper.bySpecIdAndCatagoryForInfo(repairSpecId, catagory, modelId);
    }
}