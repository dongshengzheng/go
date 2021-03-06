package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.RepairModelDetailReq;
import com.ctoangels.go.common.modules.go.mapper.RepairModelDetailReqMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairModelDetailMapper;
import com.ctoangels.go.common.modules.go.entity.RepairModelDetail;
import com.ctoangels.go.common.modules.go.service.IRepairModelDetailService;
import com.baomidou.framework.service.impl.SuperServiceImpl;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * RepairModelDetail 表数据服务层接口实现类
 */
@Service
public class RepairModelDetailServiceImpl extends SuperServiceImpl<RepairModelDetailMapper, RepairModelDetail> implements IRepairModelDetailService {

    @Autowired
    RepairModelDetailMapper repairModelDetailMapper;

    @Autowired
    RepairModelDetailReqMapper repairModelDetailReqMapper;

    @Override
    public List<RepairModelDetail> getListByCompanyId(Integer companyId) {
        EntityWrapper<RepairModelDetail> ew = new EntityWrapper();
        ew.addFilter("company_id={0} and del_flag=0", companyId);
        return repairModelDetailMapper.selectList(ew);
    }

    @Transactional
    @Override
    public void insertDetailAndDetailReq(RepairModelDetail repairModelDetail, List<RepairModelDetailReq> reqs) throws TransactionException {
        /*if(repairModelDetailMapper.insert(repairModelDetail)<0){
=======
    public Boolean insertDetailAndDetailReq(RepairModelDetail repairModelDetail, List<RepairModelDetailReq> reqs) {
        if (repairModelDetailMapper.insert(repairModelDetail) < 0) {
>>>>>>> f8f0f5caaa51aae3a206ac83472151a164b77ad5
            return false;
        }

        if (reqs.size() > 0) {

            for (RepairModelDetailReq r : reqs) {
                r.setRepairModelDetailId(repairModelDetail.getId());
            }
            if (repairModelDetailReqMapper.insertBatch(reqs) < 0) {
                return false;
            }

        }*/
        repairModelDetailMapper.insert(repairModelDetail);
        if(reqs.size()>0) {
            for (RepairModelDetailReq r : reqs) {
                r.setRepairModelDetailId(repairModelDetail.getId());
            }
            repairModelDetailReqMapper.insertBatch(reqs);
        }
    }

}