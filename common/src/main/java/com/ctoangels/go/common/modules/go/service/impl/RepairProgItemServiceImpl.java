package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.entity.ItemCount;
import com.ctoangels.go.common.modules.go.mapper.RepairSpecItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairProgItemMapper;
import com.ctoangels.go.common.modules.go.entity.RepairProgItem;
import com.ctoangels.go.common.modules.go.service.IRepairProgItemService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * RepairProgItem 表数据服务层接口实现类
 */
@Service
public class RepairProgItemServiceImpl extends SuperServiceImpl<RepairProgItemMapper, RepairProgItem> implements IRepairProgItemService {

    @Autowired
    RepairProgItemMapper repairProgItemMapper;


}