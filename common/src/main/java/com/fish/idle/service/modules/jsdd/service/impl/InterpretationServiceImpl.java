package com.fish.idle.service.modules.jsdd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.InterpretationMapper;
import com.fish.idle.service.modules.jsdd.entity.Interpretation;
import com.fish.idle.service.modules.jsdd.service.IInterpretationService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * Interpretation 表数据服务层接口实现类
 */
@Service
public class InterpretationServiceImpl extends SuperServiceImpl<InterpretationMapper, Interpretation> implements IInterpretationService {

    @Autowired
    InterpretationMapper interpretationMapper;

    @Override
    public List<Interpretation> interpretationContainImages(Integer worksId) {
        return interpretationMapper.interpretationContainImages(worksId);
    }

    @Override
    public Interpretation byIdContainImages(Integer id) {
        return interpretationMapper.byIdContainImages(id);
    }
}