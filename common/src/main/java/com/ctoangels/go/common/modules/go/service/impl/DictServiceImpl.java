package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.DictMapper;
import com.ctoangels.go.common.modules.go.entity.Dict;
import com.ctoangels.go.common.modules.go.service.IDictService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * Dict 表数据服务层接口实现类
 */
@Service
public class DictServiceImpl extends SuperServiceImpl<DictMapper, Dict> implements IDictService {

    @Autowired
    DictMapper dictMapper;

    @Override
    public List<Dict> getListByType(String type) {
        EntityWrapper<Dict> ew = new EntityWrapper<>();
        ew.addFilter("type={0} and del_flag=0", type);
        return dictMapper.selectList(ew);
    }
}