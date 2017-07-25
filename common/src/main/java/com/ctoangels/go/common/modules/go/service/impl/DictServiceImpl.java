package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.DictMapper;
import com.ctoangels.go.common.modules.go.entity.Dict;
import com.ctoangels.go.common.modules.go.service.IDictService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;
import java.util.Locale;

/**
 * Dict 表数据服务层接口实现类
 */
@Service
public class DictServiceImpl extends SuperServiceImpl<DictMapper, Dict> implements IDictService {

    @Autowired
    DictMapper dictMapper;

    @Override
    public List<Dict> getListByType(String type,Integer language) {
        EntityWrapper<Dict> ew = new EntityWrapper<>();
        ew.addFilter("type={0} and language={1} and del_flag=0", type,language);
        return dictMapper.selectList(ew);
    }

    @Override
    public String getDesByTypeAndValue(String type, String value,Integer language) {
        EntityWrapper<Dict> ew = new EntityWrapper();
        ew.setSqlSelect("des");
        ew.addFilter("type={0} and value={1} and language={2}", type, value, language);
        return selectOne(ew).getDes();
    }

    @Override
    public List<Dict> selectByType(String type) {
        EntityWrapper<Dict> ew = new EntityWrapper();
        List<Dict> dicts=null;
        if(type.equals("填表人角色") || type.equals("主管角色")){
            ew.addFilter("type={0}",type);
            dicts=dictMapper.selectList(ew);
        }else {
            Locale locale=LocaleContextHolder.getLocale();
            String language=locale.getDisplayLanguage();

            if(language.equals("中文")||language.equals("Chinese")){
                ew.addFilter("language={0}", Const.MESSAGE_ZH);
            }else if(language.equals("英文")||language.equals("English")){
                ew.addFilter("language={0}",Const.MESSAGE_EN);
            }
            ew.addFilter("type={0}",type);
            dicts=dictMapper.selectList(ew);
        }
        return dicts;



    }
}