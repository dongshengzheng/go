package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.entity.Consumer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.ConsumerMapper;
import com.ctoangels.go.common.modules.go.service.IConsumerService;
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