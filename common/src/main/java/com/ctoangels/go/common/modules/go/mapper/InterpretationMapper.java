package com.ctoangels.go.common.modules.go.mapper;

import com.ctoangels.go.common.modules.go.entity.Interpretation;
import com.baomidou.mybatisplus.mapper.AutoMapper;

import java.util.List;

/**
 * Interpretation 表数据库控制层接口
 */
public interface InterpretationMapper extends AutoMapper<Interpretation> {

    List<Interpretation> interpretationContainImages(Integer worksId);

    Interpretation byIdContainImages(Integer id);

}