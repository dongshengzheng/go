package com.ctoangels.go.common.modules.sys.service.impl;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.ctoangels.go.common.modules.sys.mapper.MenuMapper;
import com.ctoangels.go.common.modules.sys.service.MenuService;
import com.ctoangels.go.common.modules.sys.entity.Menu;
import com.ctoangels.go.common.modules.sys.mapper.MenuMapper;
import com.ctoangels.go.common.modules.sys.service.MenuService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName MenuServiceImpl.java
 * @Description:
 * @Date 2015年5月9日
 */
@Transactional(readOnly = true)
@Service
public class MenuServiceImpl extends SuperServiceImpl<MenuMapper, Menu> implements MenuService {

    @Autowired
    private MenuMapper menuMapper;
    public List<Menu> getHierarchyByPath(String url) {
        List<Menu> lists = new ArrayList<>(2);
        Menu menu = menuMapper.getByPath(url);
        if (menu != null) {
            if (menu.getParentId() != 0) {
                Menu parent = menuMapper.selectById(menu.getParentId());
                lists.add(parent);
            }
            lists.add(menu);
        }
        Locale locale= LocaleContextHolder.getLocale();
        String language=locale.getDisplayLanguage();
        if(language.equals("英文")){
            List<Menu> lists1 = new ArrayList<>(2);
            for (Menu m:lists){
                Menu menu1=changeLanguage(m);
                lists1.add(menu1);
            }
            return lists1;
        }
        return lists;
    }


    private static Menu changeLanguage(Menu m){
        if(m.getMenuName().equals("基础信息")){
            m.setMenuName("Basic information");
        }else if(m.getMenuName().equals("船舶信息")){
            m.setMenuName("Vessel details");
        }else if(m.getMenuName().equals("船厂信息")){
            m.setMenuName("Shipyard details");
        }else if(m.getMenuName().equals("公司信息")){
            m.setMenuName("Company details");
        }else if(m.getMenuName().equals("维修工程单")){
            m.setMenuName("Repair specification");
        }else if(m.getMenuName().equals("维修范本单")){
            m.setMenuName("Repair specification example");
        }else if(m.getMenuName().equals("工程单询价")){
            m.setMenuName("Repair cost inquiry");
        }else if(m.getMenuName().equals("工程单比价")){
            m.setMenuName("Repair quotation comparison");
        }else if(m.getMenuName().equals("维修进度")){
            m.setMenuName("Repair progress");
        }else if(m.getMenuName().equals("维修工程管理")){
            m.setMenuName("Repair work management");
        }else if(m.getMenuName().equals("维修进度汇报")){
            m.setMenuName("Repair progress report");
        }else if(m.getMenuName().equals("系统配置")){
            m.setMenuName("System settings");
        }else if(m.getMenuName().equals("账户设置")){
            m.setMenuName("Account settings");
        }else if(m.getMenuName().equals("公司资料")){
            m.setMenuName("Company information");
        }
        return m;
    }
}
