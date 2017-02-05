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
    public JSONObject list(Ship ship) {
        EntityWrapper<Ship> ew = getEntityWrapper();
        ew.addFilter("status <> {0}", Const.DEL_FLAG_NORMAL);
        if (!StringUtils.isEmpty(ship.getName()))
            ew.addFilter("name={0}", ship.getName());
        Page<Ship> page = shipService.selectPage(getPage(), ew);
        for (Ship ship_infor : page.getRecords()){
//            ship_infor.setCollector("James");
        }
        return jsonPage(page);
    }

}