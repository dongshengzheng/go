package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.StyleMapper;
import com.ctoangels.go.common.modules.go.entity.Style;
import com.ctoangels.go.common.modules.go.service.IStyleService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Style 表数据服务层接口实现类
 *
 */
@Service
public class StyleServiceImpl extends SuperServiceImpl<StyleMapper, Style> implements IStyleService {


}