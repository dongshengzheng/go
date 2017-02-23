package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairModelDetailMapper;
import com.ctoangels.go.common.modules.go.entity.RepairModelDetail;
import com.ctoangels.go.common.modules.go.service.IRepairModelDetailService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * RepairModelDetail 表数据服务层接口实现类
 */
@Service
public class RepairModelDetailServiceImpl extends SuperServiceImpl<RepairModelDetailMapper, RepairModelDetail> implements IRepairModelDetailService {

    @Autowired
    RepairModelDetailMapper repairModelDetailMapper;

    @Override
    public List<RepairModelDetail> getListByCompanyId(Integer companyId) {
        EntityWrapper<RepairModelDetail> ew = new EntityWrapper();
        ew.addFilter("company_id={0} and del_flag=0", companyId);
        return repairModelDetailMapper.selectList(ew);
    }
}