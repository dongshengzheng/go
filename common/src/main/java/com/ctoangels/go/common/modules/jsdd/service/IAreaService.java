package com.ctoangels.go.common.modules.jsdd.service;

import java.util.List;

import com.ctoangels.go.common.modules.jsdd.entity.City;
import com.ctoangels.go.common.modules.jsdd.entity.Province;
import com.ctoangels.go.common.modules.jsdd.entity.Province;
import com.ctoangels.go.common.modules.jsdd.entity.City;
import com.ctoangels.go.common.modules.jsdd.entity.Area;

/**
 * Created by szy on 01/12/2016.
 * 省市区联动
 */
public interface IAreaService {

    List<Province> getAllProvince();

    List<City> getCityByProvinceId(String id);

    List<Area> getAreaByCityId(String id);

}
