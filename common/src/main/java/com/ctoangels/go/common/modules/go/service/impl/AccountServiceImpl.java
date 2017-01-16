package com.ctoangels.go.common.modules.go.service.impl;

import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.AccountMapper;
import com.ctoangels.go.common.modules.go.entity.Account;
import com.ctoangels.go.common.modules.go.service.IAccountService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Account 表数据服务层接口实现类
 *
 */
@Service
public class AccountServiceImpl extends SuperServiceImpl<AccountMapper, Account> implements IAccountService {


}