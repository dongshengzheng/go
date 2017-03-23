package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.Ship;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * Ship 表数据服务层接口
 */
public interface IShipService extends ISuperService<Ship> {

    List<Ship> getListByCompanyId(Integer companyId);


}