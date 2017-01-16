package com.ctoangels.go.admin.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.admin.controller.BaseController;
import com.ctoangels.go.common.modules.go.entity.Works;
import com.ctoangels.go.common.modules.go.service.IWorksService;
import com.ctoangels.go.common.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * Works 控制层
 */
@Controller
@RequestMapping("works")
public class WorksController extends BaseController {
    @Autowired
    private IWorksService worksService;

    @RequestMapping
    public String page() {
        return "go/works/works_list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(Works works) {
        EntityWrapper<Works> ew = getEntityWrapper();
        ew.addFilter("status <> {0}", Const.WORKS_STATUS_DRAFT);
        if (!StringUtils.isEmpty(works.getName()))
            ew.addFilter("name={0}", works.getName());
        Page<Works> page = worksService.selectPage(getPage(), ew);
        for (Works works_infor : page.getRecords()){
            works_infor.setCollector("James");
        }
        return jsonPage(page);
    }

    /**
     * 审核作品
     */
    @RequestMapping(value = "check", method = RequestMethod.POST)
    @ResponseBody
    public Boolean check(Works works) {
        return worksService.updateSelectiveById(new Works(works.getId(), works.getStatus()));

    }

    /**
     * 作品轮播
     */
    @RequestMapping(value = "slide", method = RequestMethod.POST)
    @ResponseBody
    public Boolean slide(Integer id, Integer slide) {
        Works works = new Works();
        works.setId(id);
        works.setSlide(slide);
        return worksService.updateSelectiveById(works);

    }
}