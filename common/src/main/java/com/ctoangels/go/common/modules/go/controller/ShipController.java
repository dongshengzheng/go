package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.Ship;
import com.ctoangels.go.common.modules.go.service.IShipService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * Works 控制层
 */
@Controller
@RequestMapping("ship")
public class ShipController extends BaseController {
    @Autowired
    private IShipService shipService;

    @RequestMapping
    public String page() {
        return "go/ship/list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(Ship ship, @RequestParam(required = false) String keyword) {
        ship.setStatus(Const.DEL_FLAG_NORMAL);
        EntityWrapper<Ship> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.addFilter("name={0}", keyword);
        Page<Ship> page = shipService.selectPage(getPage(), ew);
        return jsonPage(page);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add() {
        return "go/ship/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(Ship ship) {
        JSONObject jsonObject = new JSONObject();
        return jsonObject;
    }

}