package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairModelDetailReqMapper;
import com.ctoangels.go.common.modules.go.entity.RepairModelDetailReq;
import com.ctoangels.go.common.modules.go.service.IRepairModelDetailReqService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * RepairModelDetailReq 表数据服务层接口实现类
 */
@Service
public class RepairModelDetailReqServiceImpl extends SuperServiceImpl<RepairModelDetailReqMapper, RepairModelDetailReq> implements IRepairModelDetailReqService {

    @Autowired
    private RepairModelDetailReqMapper repairModelDetailReqMapper;

    public void deleteRepairModelDetailById(int repair_model_detail_id) {
        repairModelDetailReqMapper.deleteRepairModelDetailById(repair_model_detail_id);
    }

    @Override
    public List<RepairModelDetailReq> getListByDetailId(Integer repairModelDetailId) {
        EntityWrapper<RepairModelDetailReq> ew = new EntityWrapper<>();
        ew.addFilter("repair_model_detail_id={0} and del_flag=0", repairModelDetailId);
        return repairModelDetailReqMapper.selectList(ew);
    }
}