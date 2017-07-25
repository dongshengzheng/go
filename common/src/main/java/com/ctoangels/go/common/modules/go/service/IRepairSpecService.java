package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.RepairSpec;
import com.baomidou.framework.service.ISuperService;
import com.ctoangels.go.common.modules.go.entity.RepairSpecItem;
import com.ctoangels.go.common.modules.go.entity.RepairSpecItemList;

import java.util.List;
import java.util.Map;

/**
 * RepairSpec 表数据服务层接口
 */
public interface IRepairSpecService extends ISuperService<RepairSpec> {

    boolean saveRepairSpec(RepairSpec repairSpec);

    Map<String, Object> updateRepairSpec(RepairSpec repairSpec, RepairSpecItemList specItemList, Integer[] repairDetailId, Integer[] deleteItemId);

    //查询本地数据同步到网上
    boolean selectLocalSyncOnline(List<RepairSpec> repairSpecs);
}