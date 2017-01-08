package com.fish.idle.service.modules.jsdd.mapper;

import com.fish.idle.service.modules.jsdd.entity.Interpretation;
import com.baomidou.mybatisplus.mapper.AutoMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Interpretation 表数据库控制层接口
 */
public interface InterpretationMapper extends AutoMapper<Interpretation> {

    List<Interpretation> interpretationContainImages(Integer worksId);

    Interpretation byIdContainImages(Integer id);

}