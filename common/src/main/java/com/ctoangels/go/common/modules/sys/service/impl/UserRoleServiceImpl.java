package com.ctoangels.go.common.modules.sys.service.impl;

import com.ctoangels.go.common.modules.sys.entity.UserRole;
import com.ctoangels.go.common.modules.sys.mapper.UserRoleMapper;
import com.ctoangels.go.common.modules.sys.service.IUserRoleService;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.sys.mapper.UserRoleMapper;
import com.ctoangels.go.common.modules.sys.entity.UserRole;
import com.ctoangels.go.common.modules.sys.service.IUserRoleService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * UserRole 表数据服务层接口实现类
 *
 */
@Service
public class UserRoleServiceImpl extends SuperServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {


}