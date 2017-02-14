package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.RepairModelItem;
import com.baomidou.mybatisplus.mapper.AutoMapper;

import java.util.List;

/**
 * RepairModelItem 表数据库控制层接口
 */
public interface RepairModelItemMapper extends AutoMapper<RepairModelItem> {

    List<RepairModelItem> byModelIdAndCatagoryContainParams(Integer modelId, String catagory);

}