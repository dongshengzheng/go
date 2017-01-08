package com.ctoangels.go.common.modules.jsdd.mapper;

import java.util.List;

import com.ctoangels.go.common.modules.jsdd.entity.City;
import com.ctoangels.go.common.modules.jsdd.entity.City;

/**
 * Created by szy on 01/12/2016.
 */
public interface CityMapper {

    List<City> getCityByProvinceId(String id);

}
