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
import org.springframework.ui.ModelMap;
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
        int companyId = getCurrentUser().getCompanyId();
        EntityWrapper<Ship> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.addFilter("name={0}", keyword);
        ew.addFilter("company_id={0}", companyId);
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
        if (shipService.insert(ship)) {
            jsonObject.put("status", 1);
        } else {
            jsonObject.put("status", 0);
            jsonObject.put("msg", "保存错误,请稍后再试");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/look", method = RequestMethod.GET)
    public String look(@RequestParam(required = false) Integer id, ModelMap map) {
        Ship ship = shipService.selectById(id);
        map.put("ship", ship);
        return "go/ship/look";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam(required = false) Integer id, ModelMap map) {
        Ship ship = shipService.selectById(id);
        map.put("ship", ship);
        return "go/ship/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editComplete(Ship ship) {
        JSONObject jsonObject = new JSONObject();
        if (shipService.updateById(ship)) {
            jsonObject.put("status", 1);
        } else {
            jsonObject.put("status", 0);
            jsonObject.put("msg", "更新错误,请稍后再试");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject delete(@RequestParam(required = false) Integer id) {
        JSONObject jsonObject = new JSONObject();
        if (shipService.deleteById(id)) {
            jsonObject.put("status", 1);
        } else {
            jsonObject.put("status", 0);
            jsonObject.put("msg", "删除错误,请稍后再试");
        }
        return jsonObject;
    }

}