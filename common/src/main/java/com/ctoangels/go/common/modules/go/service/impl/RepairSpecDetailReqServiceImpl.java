package com.ctoangels.go.common.modules.go.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.RepairModelDetailReq;
import com.ctoangels.go.common.modules.go.mapper.RepairModelDetailReqMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.RepairSpecDetailReqMapper;
import com.ctoangels.go.common.modules.go.entity.RepairSpecDetailReq;
import com.ctoangels.go.common.modules.go.service.IRepairSpecDetailReqService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.List;

/**
 * RepairSpecDetailReq 表数据服务层接口实现类
 */
@Service
public class RepairSpecDetailReqServiceImpl extends SuperServiceImpl<RepairSpecDetailReqMapper, RepairSpecDetailReq> implements IRepairSpecDetailReqService {

}