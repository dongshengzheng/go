package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.ItemCount;
import com.ctoangels.go.common.modules.go.entity.RepairProgItem;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * RepairProgItem 表数据服务层接口
 */
public interface IRepairProgItemService extends ISuperService<RepairProgItem> {

    //根据维修进度id和item类型获取具有详单的itemList,包含详单项目单号
    List<RepairProgItem> getItemsContainDetailName(Integer repairProgId, String catagory);

    //获取进度完成数量及比例
    List<ItemCount> getCount(Integer repairProgId);

}