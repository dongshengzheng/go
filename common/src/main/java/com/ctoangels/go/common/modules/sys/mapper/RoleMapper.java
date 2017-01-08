package com.ctoangels.go.common.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.ctoangels.go.common.modules.sys.entity.Role;

import java.util.List;

public interface RoleMapper extends AutoMapper<Role> {
    List<String> findRolesIdByUserId(String userId);
}