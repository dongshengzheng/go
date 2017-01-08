package com.fish.idle.service.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.fish.idle.service.modules.sys.entity.User;

import java.util.List;

public interface UserMapper extends AutoMapper<User> {

    List<User> searchUser(User user);

    List<User> searchUsersByName(String name, Integer myId);

    User searchMyInfo(Integer myId);

    List<User> searchFocusById(Integer id);

    List<User> searchUserByNameAndId(String info, Integer myId);

    List<User> searchFollowUsersByUserId(Integer id);

    List<User> searchFollowHistoryUsers(Integer followHistoryType, Integer targetId);

}