package com.fish.idle.service.modules.jsdd.service.impl;

import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.CommentsMapper;
import com.fish.idle.service.modules.jsdd.entity.Comments;
import com.fish.idle.service.modules.jsdd.service.ICommentsService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Comments 表数据服务层接口实现类
 *
 */
@Service
public class CommentsServiceImpl extends SuperServiceImpl<CommentsMapper, Comments> implements ICommentsService {


}