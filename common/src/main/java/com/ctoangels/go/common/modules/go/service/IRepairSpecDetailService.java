package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.DetailNextProNo;
import com.ctoangels.go.common.modules.go.entity.RepairSpecDetail;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * RepairSpecDetail 表数据服务层接口
 */
public interface IRepairSpecDetailService extends ISuperService<RepairSpecDetail> {

    List<RepairSpecDetail> getListBySpecIdAndCatagory(Integer specId, String catagory);

    DetailNextProNo getNextProNo(Integer specId);

}