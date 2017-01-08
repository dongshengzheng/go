package com.ctoangels.go.common.modules.jsdd.service.impl;

import com.ctoangels.go.common.modules.jsdd.service.IMessageService;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.jsdd.mapper.MessageMapper;
import com.ctoangels.go.common.modules.jsdd.entity.Message;
import com.ctoangels.go.common.modules.jsdd.service.IMessageService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Message 表数据服务层接口实现类
 *
 */
@Service
public class MessageServiceImpl extends SuperServiceImpl<MessageMapper, Message> implements IMessageService {


}