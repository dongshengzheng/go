package com.fish.idle.service.modules.sys.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.modules.sys.entity.User;
import com.fish.idle.service.modules.sys.entity.UserRole;
import com.fish.idle.service.modules.sys.mapper.RoleMapper;
import com.fish.idle.service.modules.sys.mapper.UserMapper;
import com.fish.idle.service.modules.sys.mapper.UserRoleMapper;
import com.fish.idle.service.modules.sys.service.UserService;
import com.fish.idle.service.util.Const;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName UserServiceImpl.java
 * @Description:
 * @Date 2015年5月9日
 */
@Transactional(readOnly = true)
@Service
public class UserServiceImpl extends SuperServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;

    public List<Role> getRoles(Integer userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("del_flag", 1);
        map.put("allocatable", 1);
        List<Role> roles = roleMapper.selectByMap(map);
        map = new HashMap<>();
        map.put("user_id", userId);
        List<UserRole> userRoles = userRoleMapper.selectByMap(map);
        for (Role role : roles) {
            for (UserRole userRole : userRoles) {
                if (role.getId().equals(userRole.getRoleId())) {
                    role.setChecked(true);
                    break;
                }
            }
        }
        return roles;
    }

    public void editRole(User user) {
        String roleIds = user.getRoleIds();
        if (StringUtils.isNotBlank(roleIds)) {
            List<UserRole> list = new ArrayList<>();
            Integer userId = user.getId();
            String[] roleIdArr = roleIds.split(",");
            for (String roleId : roleIdArr) {
                UserRole userRole = new UserRole();
                userRole.setUserId(userId);
                userRole.setRoleId(Integer.valueOf(roleId));
                list.add(userRole);
            }
            Map<String, Object> map = new HashMap<>();
            map.put("user_id", userId);
            userRoleMapper.deleteByMap(map);
            userRoleMapper.insertBatch(list);
        }
    }

    public boolean isNameExist(String loginName) {
        User user = new User();
        user.setLoginName(loginName);
        user.setDelFlag(1);
        int count = userMapper.selectCount(user);
        return count > 0;
    }

    public JSONObject editPassword(String password, String oldPassword) {
        JSONObject result = new JSONObject();
        Subject subject = SecurityUtils.getSubject();
        User sessionUser = (User) subject.getSession().getAttribute(Const.SESSION_USER);

        User user = userMapper.selectById(sessionUser.getId());
        String loginName = user.getLoginName();
        String encodePwd = new SimpleHash("SHA-1", loginName, oldPassword).toString();
        if (user.getPassword().equals(encodePwd)) {
            User newer = new User();
            newer.setPassword(new SimpleHash("SHA-1", loginName, password).toString());
            newer.setId(sessionUser.getId());
            userMapper.updateSelectiveById(newer);
            result.put("status", 1);
        } else {
            result.put("status", 0);
            result.put("msg", "原密码错误");
        }
        return result;
    }

    @Override
    public List<User> searchUsersByName(String name, Integer myId) {
        return userMapper.searchUsersByName(name, myId);
    }

    @Override
    public User searchMyInfo(Integer myId) {
        return userMapper.searchMyInfo(myId);
    }

    @Override
    public List<User> searchFocusById(Integer id) {
        return userMapper.searchFocusById(id);
    }

    @Override
    public List<User> searchUserByNameAndId(String info, Integer myId) {
        return userMapper.searchUserByNameAndId(info, myId);
    }

    @Override
    public List<User> searchFollowUsersByUserId(Integer id) {
        return userMapper.searchFollowUsersByUserId(id);
    }

    @Override
    public List<User> searchFollowHistoryUsers(Integer followHistoryType, Integer targetId) {
        return userMapper.searchFollowHistoryUsers(followHistoryType, targetId);
    }
}
