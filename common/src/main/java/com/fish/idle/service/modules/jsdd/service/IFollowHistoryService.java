package com.fish.idle.service.modules.jsdd.service;

import com.fish.idle.service.modules.jsdd.entity.FollowHistory;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * FollowHistory 表数据服务层接口
 */
public interface IFollowHistoryService extends ISuperService<FollowHistory> {

    //根据作品id查询出浏览历史
    List<FollowHistory> browserPeopleList(int targetId);


}