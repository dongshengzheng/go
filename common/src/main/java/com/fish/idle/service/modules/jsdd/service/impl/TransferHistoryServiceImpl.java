package com.fish.idle.service.modules.jsdd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.TransferHistoryMapper;
import com.fish.idle.service.modules.jsdd.entity.TransferHistory;
import com.fish.idle.service.modules.jsdd.service.ITransferHistoryService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * TransferHistory 表数据服务层接口实现类
 */
@Service
public class TransferHistoryServiceImpl extends SuperServiceImpl<TransferHistoryMapper, TransferHistory> implements ITransferHistoryService {
    @Autowired
    TransferHistoryMapper transferHistoryMapper;

    @Override
    public List<TransferHistory> thContainUsersInfo(Integer worksId) {
        return transferHistoryMapper.thContainUsersInfo(worksId);
    }

    @Override
    public List<TransferHistory> containWorks(Integer userId) {
        return transferHistoryMapper.containWorks(userId);
    }
}