package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.RepairSpec;
import com.baomidou.framework.service.ISuperService;
import com.ctoangels.go.common.modules.go.entity.RepairSpecItem;
import com.ctoangels.go.common.modules.go.entity.RepairSpecItemList;

import java.util.List;

/**
 * RepairSpec 表数据服务层接口
 */
public interface IRepairSpecService extends ISuperService<RepairSpec> {

    boolean saveRepairSpec(RepairSpec repairSpec, RepairSpecItemList specItemList, Integer[] repairDetailId);

    boolean updateRepairSpec(RepairSpec repairSpec, RepairSpecItemList specItemList, Integer[] repairDetailId);

}