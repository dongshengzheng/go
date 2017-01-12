package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.entity.Comments;
import com.ctoangels.go.common.modules.go.mapper.CommentsMapper;
import com.ctoangels.go.common.modules.go.service.ICommentsService;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Comments 表数据服务层接口实现类
 *
 */
@Service
public class CommentsServiceImpl extends SuperServiceImpl<CommentsMapper, Comments> implements ICommentsService {


}