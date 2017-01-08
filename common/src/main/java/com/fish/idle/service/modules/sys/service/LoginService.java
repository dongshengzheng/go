package com.fish.idle.service.modules.sys.service;

import com.fish.idle.service.modules.sys.entity.Button;
import com.fish.idle.service.modules.sys.entity.Menu;
import java.util.List;
import java.util.Map;

/**
 * Created by dongs on 2016/11/21.
 */
public interface LoginService {

    List<String> getRightsRolesId(Integer userId);
    List<Menu> getRightsParentMenus(Integer userId);

    List<Menu> getRightsSubMenus(Map<?, ?> parames);

    List<Button> getRightsButtons(Integer userId);
}
