package com.ctoangels.go.common.modules.jsdd.service;

import com.ctoangels.go.common.modules.jsdd.entity.Consumer;
import com.ctoangels.go.common.modules.jsdd.entity.Consumer;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * Consumer 表数据服务层接口
 *
 */
public interface IConsumerService extends ISuperService<Consumer> {

    Consumer getConsumerByGoodsId(Integer id);


}