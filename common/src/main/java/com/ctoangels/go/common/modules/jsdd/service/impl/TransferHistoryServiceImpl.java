package com.ctoangels.go.common.modules.jsdd.service.impl;

import com.ctoangels.go.common.modules.jsdd.mapper.TransferHistoryMapper;
import com.ctoangels.go.common.modules.jsdd.service.ITransferHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.jsdd.mapper.TransferHistoryMapper;
import com.ctoangels.go.common.modules.jsdd.entity.TransferHistory;
import com.ctoangels.go.common.modules.jsdd.service.ITransferHistoryService;
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