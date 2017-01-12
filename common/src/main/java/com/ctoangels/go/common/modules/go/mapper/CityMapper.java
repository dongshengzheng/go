package com.ctoangels.go.common.modules.go.mapper;

import java.util.List;

import com.ctoangels.go.common.modules.go.entity.City;

/**
 * Created by szy on 01/12/2016.
 */
public interface CityMapper {

    List<City> getCityByProvinceId(String id);

}
