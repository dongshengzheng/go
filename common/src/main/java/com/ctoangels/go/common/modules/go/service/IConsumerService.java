package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.Consumer;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * Consumer 表数据服务层接口
 *
 */
public interface IConsumerService extends ISuperService<Consumer> {

    Consumer getConsumerByGoodsId(Integer id);


}