package com.ctoangels.go.common.modules.jsdd.service.impl;

import com.ctoangels.go.common.modules.jsdd.entity.Comments;
import com.ctoangels.go.common.modules.jsdd.mapper.CommentsMapper;
import com.ctoangels.go.common.modules.jsdd.service.ICommentsService;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.jsdd.mapper.CommentsMapper;
import com.ctoangels.go.common.modules.jsdd.entity.Comments;
import com.ctoangels.go.common.modules.jsdd.service.ICommentsService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Comments 表数据服务层接口实现类
 *
 */
@Service
public class CommentsServiceImpl extends SuperServiceImpl<CommentsMapper, Comments> implements ICommentsService {


}