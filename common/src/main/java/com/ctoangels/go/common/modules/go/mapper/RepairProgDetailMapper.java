package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.ItemCount;
import com.ctoangels.go.common.modules.go.entity.RepairProgDetail;
import com.baomidou.mybatisplus.mapper.AutoMapper;

import java.util.List;

/**
 * RepairProgDetail 表数据库控制层接口
 */
public interface RepairProgDetailMapper extends AutoMapper<RepairProgDetail> {

    //获取进度完成数量及比例
    List<ItemCount> getCount(Integer repairProgId);

    List<RepairProgDetail> getDetailByCatagory(Integer repairProgId, String catagory);
}