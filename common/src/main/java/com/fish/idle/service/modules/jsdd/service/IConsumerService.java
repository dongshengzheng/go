package com.fish.idle.service.modules.jsdd.service;

import com.fish.idle.service.modules.jsdd.entity.Consumer;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * Consumer 表数据服务层接口
 *
 */
public interface IConsumerService extends ISuperService<Consumer> {

    Consumer getConsumerByGoodsId(Integer id);


}