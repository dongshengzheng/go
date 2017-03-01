package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.ShipMapper;
import com.ctoangels.go.common.modules.go.entity.Ship;
import com.ctoangels.go.common.modules.go.service.IShipService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * Ship 表数据服务层接口实现类
 */
@Service
public class ShipServiceImpl extends SuperServiceImpl<ShipMapper, Ship> implements IShipService {

    @Autowired
    ShipMapper shipMapper;

    @Override
    public List<Ship> getListByCompanyId(Integer companyId) {
        EntityWrapper<Ship> ew = new EntityWrapper<>();
        ew.setSqlSelect("id,name");
        ew.addFilter("del_flag=0 and company_id={0}", companyId);
        return shipMapper.selectList(ew);
    }
}