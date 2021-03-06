package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.TaskEmail;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * TaskEmail 表数据服务层接口
 */
public interface ITaskEmailService extends ISuperService<TaskEmail> {

    List<TaskEmail> getEmailList(Integer taksId);

}