package com.fish.idle.service.modules.jsdd.service.impl;

import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.MessageMapper;
import com.fish.idle.service.modules.jsdd.entity.Message;
import com.fish.idle.service.modules.jsdd.service.IMessageService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Message 表数据服务层接口实现类
 *
 */
@Service
public class MessageServiceImpl extends SuperServiceImpl<MessageMapper, Message> implements IMessageService {


}