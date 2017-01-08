package com.fish.idle.service.modules.jsdd.service;

import java.util.List;

import com.fish.idle.service.modules.jsdd.entity.Province;
import com.fish.idle.service.modules.jsdd.entity.City;
import com.fish.idle.service.modules.jsdd.entity.Area;

/**
 * Created by szy on 01/12/2016.
 * 省市区联动
 */
public interface IAreaService {

    List<Province> getAllProvince();

    List<City> getCityByProvinceId(String id);

    List<Area> getAreaByCityId(String id);

}
