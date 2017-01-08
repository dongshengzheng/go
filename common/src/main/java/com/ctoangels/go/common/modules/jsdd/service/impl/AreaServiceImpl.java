package com.ctoangels.go.common.modules.jsdd.service.impl;

import com.ctoangels.go.common.modules.jsdd.entity.City;
import com.ctoangels.go.common.modules.jsdd.entity.Province;
import com.ctoangels.go.common.modules.jsdd.mapper.AreaMapper;
import com.ctoangels.go.common.modules.jsdd.mapper.ProvinceMapper;
import com.ctoangels.go.common.modules.jsdd.service.IAreaService;
import com.ctoangels.go.common.modules.jsdd.entity.Area;
import com.ctoangels.go.common.modules.jsdd.entity.City;
import com.ctoangels.go.common.modules.jsdd.entity.Province;
import com.ctoangels.go.common.modules.jsdd.mapper.AreaMapper;
import com.ctoangels.go.common.modules.jsdd.mapper.CityMapper;
import com.ctoangels.go.common.modules.jsdd.mapper.ProvinceMapper;
import com.ctoangels.go.common.modules.jsdd.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by szy on 01/12/2016.
 * 省市区联动
 */
@Service
public class AreaServiceImpl implements IAreaService {

    @Autowired
    private ProvinceMapper provinceMapper;

    @Autowired
    private CityMapper cityMapper;

    @Autowired
    private AreaMapper areaMapper;


    @Override
    public List<Province> getAllProvince() {
        return provinceMapper.getAllProvince();
    }

    @Override
    public List<City> getCityByProvinceId(String id) {
        return cityMapper.getCityByProvinceId(id);
    }

    @Override
    public List<Area> getAreaByCityId(String id) {
        return areaMapper.getAreaByCityId(id);
    }
}
