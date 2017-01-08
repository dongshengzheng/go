package com.fish.idle.service.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.fish.idle.service.modules.sys.entity.Button;

import java.util.List;

public interface ButtonMapper  extends AutoMapper<Button> {
    List<Button> findButtonsByUserId(Integer userId);

}