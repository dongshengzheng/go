package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.entity.ItemCount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairProgDetailMapper;
import com.ctoangels.go.common.modules.go.entity.RepairProgDetail;
import com.ctoangels.go.common.modules.go.service.IRepairProgDetailService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * RepairProgDetail 表数据服务层接口实现类
 */
@Service
public class RepairProgDetailServiceImpl extends SuperServiceImpl<RepairProgDetailMapper, RepairProgDetail> implements IRepairProgDetailService {
    @Autowired
    RepairProgDetailMapper repairProgDetailMapper;

    @Override
    public List<ItemCount> getCount(Integer repairProgId) {
        return repairProgDetailMapper.getCount(repairProgId);
    }

    @Override
    public List<RepairProgDetail> getDetailByCatagory(Integer repairProgId, String catagory) {
        return repairProgDetailMapper.getDetailByCatagory(repairProgId, catagory);
    }
}