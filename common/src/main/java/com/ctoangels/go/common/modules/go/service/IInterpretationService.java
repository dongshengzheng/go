package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.Interpretation;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * Interpretation 表数据服务层接口
 */
public interface IInterpretationService extends ISuperService<Interpretation> {

    List<Interpretation> interpretationContainImages(Integer worksId);

    Interpretation byIdContainImages(Integer id);
}