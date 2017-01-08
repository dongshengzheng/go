package com.ctoangels.go.common.modules.jsdd.mapper;

import java.util.List;
import com.ctoangels.go.common.modules.jsdd.entity.Area;

/**
 * Created by szy on 01/12/2016.
 */
public interface AreaMapper {

    List<Area> getAreaByCityId(String id);

}
