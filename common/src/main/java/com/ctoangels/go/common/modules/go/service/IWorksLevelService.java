package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.WorksLevel;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * WorksLevel 表数据服务层接口
 *
 */
public interface IWorksLevelService extends ISuperService<WorksLevel> {

    WorksLevel getWorksLevelByGoodsId(Integer id);


}