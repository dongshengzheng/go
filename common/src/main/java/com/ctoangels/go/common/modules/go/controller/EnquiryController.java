package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.Enquiry;
import com.ctoangels.go.common.modules.go.entity.PrivateShipyard;
import com.ctoangels.go.common.modules.go.entity.RepairSpec;
import com.ctoangels.go.common.modules.go.service.IEnquiryReqService;
import com.ctoangels.go.common.modules.go.service.IEnquiryService;
import com.ctoangels.go.common.modules.go.service.IPrivateShipyardService;
import com.ctoangels.go.common.modules.go.service.IRepairSpecService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;


/**
 *
 * Enquiry 控制层
 *
 */
@Controller
@RequestMapping("enquiry")
public class EnquiryController extends BaseController {

    @Autowired
    private IRepairSpecService repairSpecService;

    @Autowired
    private IPrivateShipyardService privateShipyardService;

    @Autowired
    private IEnquiryService enquiryService;

    @Autowired
    private IEnquiryReqService enquiryReqService;


   /* @RequestMapping
    public String page(){
        return "go/compare/import-excel";
    }

    @RequestMapping("list")
    @ResponseBody
    public JSONObject list(){
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("ss",1);
        return jsonObject;
    }*/

    @RequestMapping("/compare")
    public String compare(@RequestParam(required = false) Integer id, ModelMap modelMap){
        RepairSpec repairSpec=repairSpecService.selectById(id);

        //获取所有的船厂
        int companyId=getCurrentUser().getCompanyId();
        EntityWrapper<PrivateShipyard> ew = getEntityWrapper();
        ew.addFilter("company_id={0}", companyId);


        List<PrivateShipyard> privateShipyards=privateShipyardService.selectList(ew);

        EntityWrapper<Enquiry> ew1=getEntityWrapper();
        ew1.addFilter("repair_spec_id={0}",id);
        List<Enquiry> enquiries=enquiryService.selectList(ew1);


        modelMap.put("enquiries",enquiries);
        modelMap.put("repairSpec",repairSpec);
        modelMap.put("shipyards",privateShipyards);
        return "go/compare/import-excel";
    }


    @RequestMapping(value = "/shipyard" ,method = RequestMethod.GET)
    @ResponseBody
    public JSONObject shipyardInfo(){
        int companyId=getCurrentUser().getCompanyId();
        JSONObject jsonObject=new JSONObject();
        EntityWrapper<PrivateShipyard> ew = getEntityWrapper();
        ew.addFilter("company_id={0}", companyId);

        List<PrivateShipyard> privateShipyards=privateShipyardService.selectList(ew);
        jsonObject.put("shipyards",privateShipyards);
        return jsonObject;
    }

    @RequestMapping(value = "/importExcel",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject importExcel( @RequestParam(value = "file", required = false)MultipartFile file,
                                   @RequestParam(required = false) Integer shipyardId,
                                   @RequestParam(required = false) Integer repairSpecId){/**/
        JSONObject jsonObject =new JSONObject();
        try{
            Enquiry enquiry=enquiryService.readExcel(file,shipyardId,repairSpecId);
            jsonObject.put("mes",1);
            jsonObject.put("name",enquiry.getPrivateShipyardName());
            jsonObject.put("total",enquiry.getQuoteTotlePrice());
        }catch (Exception e){
            e.printStackTrace();
            jsonObject.put("mes",2);
        }
        return jsonObject;
    }
}