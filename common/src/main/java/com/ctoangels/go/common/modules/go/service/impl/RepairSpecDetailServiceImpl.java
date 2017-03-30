package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.DetailNextProNo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairSpecDetailMapper;
import com.ctoangels.go.common.modules.go.entity.RepairSpecDetail;
import com.ctoangels.go.common.modules.go.service.IRepairSpecDetailService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * RepairSpecDetail 表数据服务层接口实现类
 */
@Service
public class RepairSpecDetailServiceImpl extends SuperServiceImpl<RepairSpecDetailMapper, RepairSpecDetail> implements IRepairSpecDetailService {
    @Autowired
    RepairSpecDetailMapper repairSpecDetailMapper;

    @Override
    public List<RepairSpecDetail> getListBySpecIdAndCatagory(Integer specId, String catagory) {
        EntityWrapper<RepairSpecDetail> ew = new EntityWrapper<>();
        ew.addFilter("repair_spec_id={0} and catagory={1} and del_flag=0 ", specId, catagory);
        return repairSpecDetailMapper.selectList(ew);
    }

    @Override
    public DetailNextProNo getNextProNo(Integer specId) {
        return repairSpecDetailMapper.getNextProNo(specId);
    }


}