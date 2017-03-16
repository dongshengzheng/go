package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.TaskEmailMapper;
import com.ctoangels.go.common.modules.go.entity.TaskEmail;
import com.ctoangels.go.common.modules.go.service.ITaskEmailService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * TaskEmail 表数据服务层接口实现类
 *
 */
@Service
public class TaskEmailServiceImpl extends SuperServiceImpl<TaskEmailMapper, TaskEmail> implements ITaskEmailService {


}