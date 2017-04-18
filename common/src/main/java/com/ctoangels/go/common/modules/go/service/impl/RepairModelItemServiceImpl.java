package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairModelItemMapper;
import com.ctoangels.go.common.modules.go.entity.RepairModelItem;
import com.ctoangels.go.common.modules.go.service.IRepairModelItemService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * RepairModelItem 表数据服务层接口实现类
 */
@Service
public class RepairModelItemServiceImpl extends SuperServiceImpl<RepairModelItemMapper, RepairModelItem> implements IRepairModelItemService {
    @Autowired
    RepairModelItemMapper repairModelItemMapper;

    @Override
    public List<RepairModelItem> byModelIdAndCatagoryContainParams(Integer modelId, String catagory,Integer language) {
        return repairModelItemMapper.byModelIdAndCatagoryContainParams(modelId, catagory,language);
    }
}