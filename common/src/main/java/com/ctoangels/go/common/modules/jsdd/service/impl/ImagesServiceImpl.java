package com.ctoangels.go.common.modules.jsdd.service.impl;

import com.ctoangels.go.common.modules.jsdd.mapper.ImagesMapper;
import com.ctoangels.go.common.modules.jsdd.service.IImagesService;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.jsdd.mapper.ImagesMapper;
import com.ctoangels.go.common.modules.jsdd.entity.Images;
import com.ctoangels.go.common.modules.jsdd.service.IImagesService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * Images 表数据服务层接口实现类
 *
 */
@Service
public class ImagesServiceImpl extends SuperServiceImpl<ImagesMapper, Images> implements IImagesService {
    public void insertImage(String images, Integer targetId, String types) {
        // 保存图片信息
        if (images != null && images.trim().length() > 0) {
            String[] urls = images.split(",");
            List<Images> list = new ArrayList<>();
            for (String url : urls) {
                Images img = new Images();
                img.setTargetId(targetId);
                img.setUrl(url);
                img.setType(types);
                list.add(img);
            }
            insertBatch(list);
        }
    }

}