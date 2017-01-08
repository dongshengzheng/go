package com.fish.idle.service.modules.jsdd.service;

import com.fish.idle.service.modules.jsdd.entity.WorksLevel;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * WorksLevel 表数据服务层接口
 *
 */
public interface IWorksLevelService extends ISuperService<WorksLevel> {

    WorksLevel getWorksLevelByGoodsId(Integer id);


}