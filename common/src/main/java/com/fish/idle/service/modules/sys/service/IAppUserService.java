package com.fish.idle.service.modules.sys.service;

import com.fish.idle.service.modules.sys.entity.AppUser;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * AppUser 表数据服务层接口
 */
public interface IAppUserService extends ISuperService<AppUser> {


    List<AppUser> searchUsersByName(String name, Integer myId);

    AppUser searchMyInfo(Integer myId);

    List<AppUser> searchFocusById(Integer id);

    List<AppUser> searchUserByNameAndId(String info, Integer myId);

    List<AppUser> searchFollowUsersByUserId(Integer id);

    List<AppUser> searchFollowHistoryUsers(Integer followHistoryType, Integer targetId);

    boolean isNameExist(String loginName);

    List<AppUser> siteSearchUsersByName(String name, int size, int from, int myId);

    AppUser siteByIdContainWorksFocusCount(int userId);

    List<AppUser> siteSearchFansByUserId(int userId, int size, int from, int myId);
}