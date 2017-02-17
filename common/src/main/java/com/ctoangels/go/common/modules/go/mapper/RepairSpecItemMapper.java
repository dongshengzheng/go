package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.RepairSpecItem;
import com.baomidou.mybatisplus.mapper.AutoMapper;

import java.util.List;

/**
 * RepairSpecItem 表数据库控制层接口
 */
public interface RepairSpecItemMapper extends AutoMapper<RepairSpecItem> {

    List<RepairSpecItem> bySpecIdAndCatagoryContainParams(Integer repairSpecId, String catagory, Integer modelId);
}