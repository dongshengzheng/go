package com.ctoangels.go.common.modules.sys.service;

import com.ctoangels.go.common.modules.sys.entity.Button;
import com.ctoangels.go.common.modules.sys.entity.Menu;
import com.ctoangels.go.common.modules.sys.entity.Button;
import com.ctoangels.go.common.modules.sys.entity.Menu;
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
