package com.fish.idle.service.modules.jsdd.mapper;

import com.fish.idle.service.modules.jsdd.entity.WorksLevel;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * WorksLevel 表数据库控制层接口
 *
 */
public interface WorksLevelMapper extends AutoMapper<WorksLevel> {

    WorksLevel getWorksLevelByGoodsId(Integer id);

}