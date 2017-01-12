package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.mapper.WorksMapper;
import com.ctoangels.go.common.modules.go.service.IWorksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.entity.Works;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * Works 表数据服务层接口实现类
 */
@Service
public class WorksServiceImpl extends SuperServiceImpl<WorksMapper, Works> implements IWorksService {
    @Autowired
    WorksMapper worksMapper;

    @Override
    public List<Works> transferWorksList(Integer userId) {
        return worksMapper.transferWorksList(userId);
    }

    @Override
    public List<Works> collectionWorksList(Integer userId) {
        return worksMapper.collectionWorksList(userId);
    }
}