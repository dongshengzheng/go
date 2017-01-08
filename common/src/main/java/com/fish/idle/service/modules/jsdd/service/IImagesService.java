package com.fish.idle.service.modules.jsdd.service;

import com.fish.idle.service.modules.jsdd.entity.Images;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * Images 表数据服务层接口
 *
 */
public interface IImagesService extends ISuperService<Images> {
    void insertImage(String images, Integer targetId, String types);

}