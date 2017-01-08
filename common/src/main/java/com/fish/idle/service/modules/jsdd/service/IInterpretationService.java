package com.fish.idle.service.modules.jsdd.service;

import com.fish.idle.service.modules.jsdd.entity.Interpretation;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * Interpretation 表数据服务层接口
 */
public interface IInterpretationService extends ISuperService<Interpretation> {

    List<Interpretation> interpretationContainImages(Integer worksId);

    Interpretation byIdContainImages(Integer id);
}