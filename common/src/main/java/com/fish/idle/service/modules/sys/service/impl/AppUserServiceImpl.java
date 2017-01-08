package com.fish.idle.service.modules.sys.service.impl;

import com.fish.idle.service.modules.sys.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.sys.mapper.AppUserMapper;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * AppUser 表数据服务层接口实现类
 */
@Service
public class AppUserServiceImpl extends SuperServiceImpl<AppUserMapper, AppUser> implements IAppUserService {

    @Autowired
    private AppUserMapper appUserMapper;

    @Override
    public List<AppUser> searchUsersByName(String name, Integer myId) {
        return appUserMapper.searchUsersByName(name, myId);
    }

    @Override
    public AppUser searchMyInfo(Integer myId) {
        return appUserMapper.searchMyInfo(myId);
    }

    @Override
    public List<AppUser> searchFocusById(Integer id) {
        return appUserMapper.searchFocusById(id);
    }

    @Override
    public List<AppUser> searchUserByNameAndId(String info, Integer myId) {
        return appUserMapper.searchUserByNameAndId(info, myId);
    }

    @Override
    public List<AppUser> searchFollowUsersByUserId(Integer id) {
        return appUserMapper.searchFollowUsersByUserId(id);
    }

    @Override
    public List<AppUser> searchFollowHistoryUsers(Integer followHistoryType, Integer targetId) {
        return appUserMapper.searchFollowHistoryUsers(followHistoryType, targetId);
    }

    @Override
    public boolean isNameExist(String loginName) {
        AppUser appUser = new AppUser();
        appUser.setLoginName(loginName);
        int count = appUserMapper.selectCount(appUser);
        return count > 0;
    }

    @Override
    public List<AppUser> siteSearchUsersByName(String name, int size, int from, int myId) {
        return appUserMapper.siteSearchUsersByName(name, size, from, myId);
    }

    @Override
    public AppUser siteByIdContainWorksFocusCount(int userId) {
        return appUserMapper.siteByIdContainWorksFocusCount(userId);
    }

    @Override
    public List<AppUser> siteSearchFansByUserId(int userId, int size, int from, int myId) {
        return appUserMapper.siteSearchFansByUserId(userId, size, from, myId);
    }


}