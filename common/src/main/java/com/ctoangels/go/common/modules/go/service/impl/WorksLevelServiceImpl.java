package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.entity.WorksLevel;
import com.ctoangels.go.common.modules.go.mapper.WorksLevelMapper;
import com.ctoangels.go.common.modules.go.service.IWorksLevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * WorksLevel 表数据服务层接口实现类
 *
 */
@Service
public class WorksLevelServiceImpl extends SuperServiceImpl<WorksLevelMapper, WorksLevel> implements IWorksLevelService {

    @Autowired
    private WorksLevelMapper worksLevelMapper;

    @Override
    public WorksLevel getWorksLevelByGoodsId(Integer id) {
        return worksLevelMapper.getWorksLevelByGoodsId(id);
    }
}