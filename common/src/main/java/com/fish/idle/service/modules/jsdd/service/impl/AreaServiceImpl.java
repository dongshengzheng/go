package com.fish.idle.service.modules.jsdd.service.impl;

import com.fish.idle.service.modules.jsdd.entity.Area;
import com.fish.idle.service.modules.jsdd.entity.City;
import com.fish.idle.service.modules.jsdd.entity.Province;
import com.fish.idle.service.modules.jsdd.mapper.AreaMapper;
import com.fish.idle.service.modules.jsdd.mapper.CityMapper;
import com.fish.idle.service.modules.jsdd.mapper.ProvinceMapper;
import com.fish.idle.service.modules.jsdd.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by szy on 01/12/2016.
 * 省市区联动
 */
@Service
public class AreaServiceImpl implements IAreaService{

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
