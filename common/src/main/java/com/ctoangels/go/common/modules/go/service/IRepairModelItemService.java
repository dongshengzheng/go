package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.RepairModelItem;
import com.baomidou.framework.service.ISuperService;
import com.ctoangels.go.common.modules.go.mapper.RepairModelItemMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * RepairModelItem 表数据服务层接口
 */
public interface IRepairModelItemService extends ISuperService<RepairModelItem> {

    List<RepairModelItem> byModelIdAndCatagoryContainParams(Integer modelId, String catagory);

}