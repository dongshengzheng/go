package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.go.service.online.ISyncService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import com.ctoangels.go.common.util.MacAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by zhen_Tomcat on 2017/04/25.
 */
@Controller
@RequestMapping("sync")
public class SyncController extends BaseController {

    @Autowired
    private ISyncService syncService;

    @Autowired
    private IShipService shipService;

    @Autowired
    private IRepairSpecService repairSpecService;

    @Autowired
    private IRepairSpecItemService repairSpecItemService;

    @Autowired
    private IRepairSpecDetailService repairSpecDetailService;

    @Autowired
    private IRepairSpecDetailReqService repairSpecDetailReqService;

    @Autowired
    private IRepairSpecDetailMediaService repairSpecDetailMediaService;

    @RequestMapping("/loading")
    @ResponseBody
    public JSONObject list(){

        Integer companyId=getCurrentUser().getCompanyId();
        String a=MacAddress.transBytesToStr();

        JSONObject jsonObject=new JSONObject();

        //删除服务器上的工程单
        try{
            syncService.deleteOnlineRepairSpec(companyId);
            syncService.deleteShipByCompanyId(companyId);

            EntityWrapper<RepairSpec> ew=getEntityWrapper();
            ew.addFilter("company_id={0}",companyId);
            List<RepairSpec> repairSpecs=repairSpecService.selectList(ew);

            repairSpecService.selectLocalSyncOnline(repairSpecs);

            jsonObject.put("mes",true);

        }catch (Exception e){
            jsonObject.put("mes",false);
            e.printStackTrace();
        }

        return jsonObject;
    }

}
