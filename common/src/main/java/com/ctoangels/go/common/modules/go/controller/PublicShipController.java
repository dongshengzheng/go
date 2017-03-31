package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.PublicShip;
import com.ctoangels.go.common.modules.go.entity.Ship;
import com.ctoangels.go.common.modules.go.service.IPublicShipService;
import com.ctoangels.go.common.modules.go.service.IShipTypeService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * PublicShip 控制层
 */
@Controller
@RequestMapping(value = "publicShip")
public class PublicShipController extends BaseController {
    @Autowired
    private IPublicShipService publicShipService;

    @Autowired
    private IShipTypeService shipTypeService;

    @RequestMapping(value = "/searchList")
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String keyword) {
        JSONObject jsonObject = new JSONObject();
        EntityWrapper<PublicShip> ew = new EntityWrapper<>();
        if (!StringUtils.isEmpty(keyword)) {
            ew.like("name", keyword);
            ew.or("imo like {0}", "%" + keyword + "%");
            ew.or("callsign like {0}", "%" + keyword + "%");
        }
        ew.setSqlSelect("id,name,imo,dwt,callsign");
        Page p = getPage();
        p.setSize(10);
        Page<PublicShip> page = publicShipService.selectPage(p, ew);
        jsonObject.put("list", page.getRecords());
        return jsonObject;
    }

    @RequestMapping(value = "/searchOne")
    @ResponseBody
    public JSONObject one(@RequestParam(required = false) Integer id){
        JSONObject jsonObject=new JSONObject();
        try{
            PublicShip publicShip=publicShipService.selectById(id);
            publicShip.setCategory(shipTypeService.selectById(publicShip.getTypeId()).getCategory());

            jsonObject.put("mes",publicShip);
        }catch (Exception e){
            e.printStackTrace();
            jsonObject.put("mes",false);
        }

        return jsonObject;
    }

}