package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.RepairModelDetail;
import com.baomidou.framework.service.ISuperService;
import com.ctoangels.go.common.modules.go.entity.RepairModelDetailReq;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * RepairModelDetail 表数据服务层接口
 */
public interface IRepairModelDetailService extends ISuperService<RepairModelDetail> {

    List<RepairModelDetail> getListByCompanyId(Integer companyId);

    @Transactional
    void insertDetailAndDetailReq(RepairModelDetail repairModelDetail,List<RepairModelDetailReq> reqs)throws TransactionException;

}