package com.fish.idle.service.modules.jsdd.mapper;

import com.fish.idle.service.modules.jsdd.entity.Consumer;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * Consumer 表数据库控制层接口
 *
 */
public interface ConsumerMapper extends AutoMapper<Consumer> {

    Consumer getConsumerByGoodsId(Integer id);


}