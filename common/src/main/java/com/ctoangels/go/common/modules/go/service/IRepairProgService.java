package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.RepairProg;
import com.baomidou.framework.service.ISuperService;

/**
 * RepairProg 表数据服务层接口
 */
public interface IRepairProgService extends ISuperService<RepairProg> {

    //根据id获取该工程总完成百分比
    Double getPerById(Integer repairProgId);

}