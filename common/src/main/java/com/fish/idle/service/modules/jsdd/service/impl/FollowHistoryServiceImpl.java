package com.fish.idle.service.modules.jsdd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.FollowHistoryMapper;
import com.fish.idle.service.modules.jsdd.entity.FollowHistory;
import com.fish.idle.service.modules.jsdd.service.IFollowHistoryService;
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