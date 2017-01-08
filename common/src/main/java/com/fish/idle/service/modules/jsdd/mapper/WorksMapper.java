package com.fish.idle.service.modules.jsdd.mapper;

import com.fish.idle.service.modules.jsdd.entity.Works;
import com.baomidou.mybatisplus.mapper.AutoMapper;

import java.util.List;

/**
 * Works 表数据库控制层接口
 */
public interface WorksMapper extends AutoMapper<Works> {

    //    根据用户id查询转入或转出的作品
    List<Works> transferWorksList(Integer userId);

    //    根据用户id查询收藏的作品
    List<Works> collectionWorksList(Integer userId);

}