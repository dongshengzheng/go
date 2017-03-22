package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.ItemCount;
import com.ctoangels.go.common.modules.go.entity.RepairProgDetail;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * RepairProgDetail 表数据服务层接口
 */
public interface IRepairProgDetailService extends ISuperService<RepairProgDetail> {

    //获取进度完成数量及比例
    List<ItemCount> getCount(Integer repairProgId);

    List<RepairProgDetail> getDetailByCatagory(Integer repairProgId, String catagory);

    //根据reportId  获取相关详单
    List<RepairProgDetail> getByReportId(Integer reportId);

}