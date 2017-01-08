package com.fish.idle.service.modules.jsdd.mapper;

import java.util.List;

import com.fish.idle.service.modules.jsdd.entity.City;

/**
 * Created by szy on 01/12/2016.
 */
public interface CityMapper {

    List<City> getCityByProvinceId(String id);

}
