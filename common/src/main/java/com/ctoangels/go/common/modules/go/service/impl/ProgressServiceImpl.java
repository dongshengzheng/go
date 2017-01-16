package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.ProgressMapper;
import com.ctoangels.go.common.modules.go.entity.Progress;
import com.ctoangels.go.common.modules.go.service.IProgressService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Progress 表数据服务层接口实现类
 *
 */
@Service
public class ProgressServiceImpl extends SuperServiceImpl<ProgressMapper, Progress> implements IProgressService {


}