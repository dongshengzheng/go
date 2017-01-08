package com.fish.idle.service.modules.jsdd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.ConsumerMapper;
import com.fish.idle.service.modules.jsdd.entity.Consumer;
import com.fish.idle.service.modules.jsdd.service.IConsumerService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Consumer 表数据服务层接口实现类
 *
 */
@Service
public class ConsumerServiceImpl extends SuperServiceImpl<ConsumerMapper, Consumer> implements IConsumerService {

    @Autowired
    private ConsumerMapper consumerMapper;

    @Override
    public Consumer getConsumerByGoodsId(Integer id) {
        return consumerMapper.getConsumerByGoodsId(id);
    }
}