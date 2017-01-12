package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.Consumer;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * Consumer 表数据库控制层接口
 *
 */
public interface ConsumerMapper extends AutoMapper<Consumer> {

    Consumer getConsumerByGoodsId(Integer id);


}