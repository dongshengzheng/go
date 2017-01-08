package com.fish.idle.service.modules.sys.service;

import com.baomidou.framework.service.ISuperService;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.modules.sys.entity.RoleTree;

import java.util.List;

public interface RoleService extends ISuperService<Role> {


    List<RoleTree> listTreeData(Integer roleId);

    void editRight(String selRes, Integer roleId);
}
