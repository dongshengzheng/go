package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.RepairSpecItem;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * RepairSpecItem 表数据服务层接口
 */
public interface IRepairSpecItemService extends ISuperService<RepairSpecItem> {

    List<RepairSpecItem> bySpecIdAndCatagoryContainParams(Integer repairSpecId, String catagory, Integer modelId);
}