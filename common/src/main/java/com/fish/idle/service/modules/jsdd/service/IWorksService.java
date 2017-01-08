package com.fish.idle.service.modules.jsdd.service;

import com.fish.idle.service.modules.jsdd.entity.Works;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * Works 表数据服务层接口
 */
public interface IWorksService extends ISuperService<Works> {

    //    根据用户id查询转入或转出的作品
    List<Works> transferWorksList(Integer userId);

    //    根据用户id查询收藏的作品
    List<Works> collectionWorksList(Integer userId);
}