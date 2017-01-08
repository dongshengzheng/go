package com.ctoangels.go.common.modules.sys.service;

import com.baomidou.framework.service.ISuperService;
import com.ctoangels.go.common.modules.sys.entity.RoleTree;
import com.ctoangels.go.common.modules.sys.entity.Role;
import com.ctoangels.go.common.modules.sys.entity.RoleTree;

import java.util.List;

public interface RoleService extends ISuperService<Role> {


    List<RoleTree> listTreeData(Integer roleId);

    void editRight(String selRes, Integer roleId);
}
