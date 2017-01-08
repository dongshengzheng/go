package com.fish.idle.service.modules.sys.mapper;

import com.fish.idle.service.modules.sys.entity.AppUser;
import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.fish.idle.service.modules.sys.entity.User;

import java.util.List;

/**
 * AppUser 表数据库控制层接口
 */
public interface AppUserMapper extends AutoMapper<AppUser> {

    List<AppUser> searchUsersByName(String name, Integer myId);

    AppUser searchMyInfo(Integer myId);

    List<AppUser> searchFocusById(Integer id);

    List<AppUser> searchUserByNameAndId(String info, Integer myId);

    List<AppUser> searchFollowUsersByUserId(Integer id);

    List<AppUser> searchFollowHistoryUsers(Integer followHistoryType, Integer targetId);

    //site端使用
    List<AppUser> siteSearchUsersByName(String name, int size, int from, int myId);

    AppUser siteByIdContainWorksFocusCount(int userId);

    List<AppUser> siteSearchFansByUserId(int userId, int size, int from, int myId);

}