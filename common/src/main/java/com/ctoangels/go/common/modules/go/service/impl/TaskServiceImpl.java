package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.TaskMapper;
import com.ctoangels.go.common.modules.go.entity.Task;
import com.ctoangels.go.common.modules.go.service.ITaskService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Task 表数据服务层接口实现类
 *
 */
@Service
public class TaskServiceImpl extends SuperServiceImpl<TaskMapper, Task> implements ITaskService {


}