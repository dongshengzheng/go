package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.CompanyMapper;
import com.ctoangels.go.common.modules.go.entity.Company;
import com.ctoangels.go.common.modules.go.service.ICompanyService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Company 表数据服务层接口实现类
 *
 */
@Service
public class CompanyServiceImpl extends SuperServiceImpl<CompanyMapper, Company> implements ICompanyService {


}