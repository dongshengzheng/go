package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.Dict;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * Dict 表数据服务层接口
 */
public interface IDictService extends ISuperService<Dict> {

    List<Dict> getListByType(String type,Integer language);

    String getDesByTypeAndValue(String type, String value,Integer language);

    List<Dict> selectByType(String type);
}