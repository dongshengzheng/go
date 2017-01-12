package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.entity.FollowHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.FollowHistoryMapper;
import com.ctoangels.go.common.modules.go.service.IFollowHistoryService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * FollowHistory 表数据服务层接口实现类
 */
@Service
public class FollowHistoryServiceImpl extends SuperServiceImpl<FollowHistoryMapper, FollowHistory> implements IFollowHistoryService {

    @Autowired
    FollowHistoryMapper followHistoryMapper;

    @Override
    public List<FollowHistory> browserPeopleList(int targetId) {
        return followHistoryMapper.browserPeopleList(targetId);
    }
}