package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.MemoMediaMapper;
import com.ctoangels.go.common.modules.go.entity.MemoMedia;
import com.ctoangels.go.common.modules.go.service.IMemoMediaService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * MemoMedia 表数据服务层接口实现类
 *
 */
@Service
public class MemoMediaServiceImpl extends SuperServiceImpl<MemoMediaMapper, MemoMedia> implements IMemoMediaService {

    @Autowired
    private MemoMediaMapper memoMediaMapper;

    @Override
    public Boolean deleteByReportDetailId(Integer reportDetailId) {
        return memoMediaMapper.deleteByReportDetailId(reportDetailId);
    }
}