package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.FollowHistory;
import com.baomidou.mybatisplus.mapper.AutoMapper;

import java.util.List;

/**
 * FollowHistory 表数据库控制层接口
 */
public interface FollowHistoryMapper extends AutoMapper<FollowHistory> {

    List<FollowHistory> browserPeopleList(int targetId);

}