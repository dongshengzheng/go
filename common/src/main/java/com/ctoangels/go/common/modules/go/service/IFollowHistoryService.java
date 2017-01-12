package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.FollowHistory;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * FollowHistory 表数据服务层接口
 */
public interface IFollowHistoryService extends ISuperService<FollowHistory> {

    //根据作品id查询出浏览历史
    List<FollowHistory> browserPeopleList(int targetId);


}