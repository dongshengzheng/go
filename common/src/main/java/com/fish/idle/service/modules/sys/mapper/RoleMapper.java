package com.fish.idle.service.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.fish.idle.service.modules.sys.entity.Role;

import java.util.List;

public interface RoleMapper extends AutoMapper<Role> {
    List<String> findRolesIdByUserId(String userId);
}