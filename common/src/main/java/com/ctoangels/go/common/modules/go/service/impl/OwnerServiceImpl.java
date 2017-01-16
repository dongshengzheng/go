package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.OwnerMapper;
import com.ctoangels.go.common.modules.go.entity.Owner;
import com.ctoangels.go.common.modules.go.service.IOwnerService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Owner 表数据服务层接口实现类
 *
 */
@Service
public class OwnerServiceImpl extends SuperServiceImpl<OwnerMapper, Owner> implements IOwnerService {


}