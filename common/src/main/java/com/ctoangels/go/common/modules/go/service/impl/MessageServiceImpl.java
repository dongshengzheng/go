package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.service.IMessageService;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.MessageMapper;
import com.ctoangels.go.common.modules.go.entity.Message;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Message 表数据服务层接口实现类
 *
 */
@Service
public class MessageServiceImpl extends SuperServiceImpl<MessageMapper, Message> implements IMessageService {


}