package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.PriceMapper;
import com.ctoangels.go.common.modules.go.entity.Price;
import com.ctoangels.go.common.modules.go.service.IPriceService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Price 表数据服务层接口实现类
 *
 */
@Service
public class PriceServiceImpl extends SuperServiceImpl<PriceMapper, Price> implements IPriceService {


}