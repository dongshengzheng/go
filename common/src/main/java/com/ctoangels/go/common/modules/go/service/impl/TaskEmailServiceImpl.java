package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.TaskEmailMapper;
import com.ctoangels.go.common.modules.go.entity.TaskEmail;
import com.ctoangels.go.common.modules.go.service.ITaskEmailService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * TaskEmail 表数据服务层接口实现类
 */
@Service
public class TaskEmailServiceImpl extends SuperServiceImpl<TaskEmailMapper, TaskEmail> implements ITaskEmailService {

    @Autowired
    TaskEmailMapper taskEmailMapper;

    @Override
    public List<TaskEmail> getEmailList(Integer taksId) {
        EntityWrapper<TaskEmail> ew = new EntityWrapper();
        ew.addFilter("task_id={0}", taksId);
        return taskEmailMapper.selectList(ew);
    }
}