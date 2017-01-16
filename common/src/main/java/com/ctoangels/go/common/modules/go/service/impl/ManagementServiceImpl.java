package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.ManagementMapper;
import com.ctoangels.go.common.modules.go.entity.Management;
import com.ctoangels.go.common.modules.go.service.IManagementService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Management 表数据服务层接口实现类
 *
 */
@Service
public class ManagementServiceImpl extends SuperServiceImpl<ManagementMapper, Management> implements IManagementService {


}