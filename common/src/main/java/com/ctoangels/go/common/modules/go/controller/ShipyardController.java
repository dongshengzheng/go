package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.Ship;
import com.ctoangels.go.common.modules.go.entity.Shipyard;
import com.ctoangels.go.common.modules.go.service.IShipyardService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Shipyard 控制层
 */
@Controller
@RequestMapping("shipyard")
public class ShipyardController extends BaseController {

    @Autowired
    private IShipyardService shipyardService;

    @RequestMapping
    public String page() {
        return "go/shipyard/list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String keyword) {
        EntityWrapper<Shipyard> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.like("name", keyword);
        Page<Shipyard> page = shipyardService.selectPage(getPage(), ew);
        return jsonPage(page);
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add() {
        return "go/shipyard/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public JSONObject addComplete(Shipyard shipyard) {
        JSONObject jsonObject = new JSONObject();
        return jsonObject;
    }

    @RequestMapping(value = "/look", method = RequestMethod.GET)
    public String look(@RequestParam(required = false) Integer id, ModelMap map) {
        Shipyard shipyard = shipyardService.selectById(id);
        map.put("shipyard", shipyard);
        return "go/shipyard/look";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam(required = false) Integer id, ModelMap map) {
        Shipyard shipyard = shipyardService.selectById(id);
        map.put("shipyard", shipyard);
        return "go/shipyard/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editComplete(Shipyard shipyard) {
        JSONObject jsonObject = new JSONObject();
        if (shipyardService.updateById(shipyard)) {
            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "编辑时出错,请稍后再试");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject delete(@RequestParam(required = false) Integer id) {
        JSONObject jsonObject = new JSONObject();
        if (shipyardService.deleteById(id)) {
            jsonObject.put("status", 1);
        } else {
            jsonObject.put("status", 0);
            jsonObject.put("msg", "删除错误,请稍后再试");
        }
        return jsonObject;
    }

}