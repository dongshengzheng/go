package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.Images;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * Images 表数据服务层接口
 *
 */
public interface IImagesService extends ISuperService<Images> {
    void insertImage(String images, Integer targetId, String types);

}