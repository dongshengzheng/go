package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.RepairSpecItem;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * RepairSpecItem 表数据服务层接口
 */
public interface IRepairSpecItemService extends ISuperService<RepairSpecItem> {

    //    查询用  无可选值列表
    List<RepairSpecItem> bySpecIdAndCatagoryWithParamsNoValue(Integer repairSpecId, String catagory, Integer modelId);

    //    编辑用  含选值列表
    List<RepairSpecItem> bySpecIdAndCatagoryWithParamsAndValue(Integer repairSpecId, String catagory, Integer modelId);

    //    查询用  仅查询被勾选的项目
    List<RepairSpecItem> bySpecIdAndCatagoryForInfo(Integer repairSpecId, String catagory, Integer modelId);

}