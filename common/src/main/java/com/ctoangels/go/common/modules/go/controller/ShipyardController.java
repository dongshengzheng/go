package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Shipyard 控制层
 */
@Controller
@RequestMapping("shipyard")
public class ShipyardController extends BaseController {

    @Autowired
    private IShipyardService shipyardService;

    @Autowired
    private IGeneralDetailService generalDetailService;

    @Autowired
    private IWharfDetailService wharfDetailService;

    @Autowired
    private IBerthDetailService berthDetailService;

    @Autowired
    private IFacilityDetailService facilityDetailService;

    @Autowired
    private IPrivateShipyardService privateShipyardService;

    @RequestMapping
    public String page() {
        return "go/shipyard/list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String keyword) {
        int companyId=getCurrentUser().getCompanyId();
        EntityWrapper<PrivateShipyard> ew = getEntityWrapper();
        ew.addFilter("company_id",companyId);
        if (!StringUtils.isEmpty(keyword))
            ew.like("name", keyword);

        Page<PrivateShipyard> page = privateShipyardService.selectPage(getPage(), ew);
        return jsonPage(page);
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add() {
        return "go/shipyard/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addComplete(PrivateShipyard privateShipyard) {
        JSONObject jsonObject = new JSONObject();
        int companyId=getCurrentUser().getCompanyId();
        privateShipyard.setCompanyId(companyId);
        privateShipyard.setDelFlag(Const.DEL_FLAG_NORMAL);
       if( privateShipyardService.insert(privateShipyard)){
            jsonObject.put("success",true);
        }else{
            jsonObject.put("success",false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }

    //查看船厂详细信息
    @RequestMapping(value = "/look", method = RequestMethod.GET)
    public String look(@RequestParam(required = false) Integer id, ModelMap map) {
        //根据PrivateShipyard的id获取对象
        PrivateShipyard privateShipyard=privateShipyardService.selectById(id);

        EntityWrapper<Shipyard> ew3 = getEntityWrapper();
        ew3.addFilter("name={0}", privateShipyard.getName());
        Shipyard shipyard = shipyardService.selectOne(ew3);

        //判断数据库里面是否有船东写的船厂
        if(shipyard==null){
            map.put("mes",true);
            return "go/shipyard/list";
        }

        map.put("shipyard", shipyard);

        //查看一般信息中的Convemsion 项目
        EntityWrapper<GeneralDetail> ew4 = getEntityWrapper();
        ew4.addFilter("item_category={0} and shipyard_id={1}", "Convemsion Projects",shipyard.getId());
        List<GeneralDetail> convemsions=generalDetailService.selectList(ew4);
        map.put("convemsions",convemsions);

        //查看一般信息中的Repairing 项目
        EntityWrapper<GeneralDetail> ew5 = getEntityWrapper();
        ew5.addFilter("item_category={0} and shipyard_id={1}", "Repairing Projects",shipyard.getId());
        List<GeneralDetail> repairs =generalDetailService.selectList(ew5);
        map.put("repairs",repairs);

        //查看一般信息中的Major  项目
        EntityWrapper<GeneralDetail> ew6 = getEntityWrapper();
        ew6.addFilter("item_category={0} and shipyard_id={1}", "Major Clients",shipyard.getId());
        List<GeneralDetail> majors =generalDetailService.selectList(ew6);
        map.put("majors",majors);

        //查看设施信息的中的起重机信息
        EntityWrapper<FacilityDetail> ew = getEntityWrapper();
        ew.addFilter("faci_category={0} and shipyard_id={1}", "Cranes Details",shipyard.getId());
        List<FacilityDetail> cranes=facilityDetailService.selectList(ew);
        map.put("cranes",cranes);

        //查看设施信息的中的拖船信息
        EntityWrapper<FacilityDetail> ew1 = getEntityWrapper();
        ew1.addFilter("faci_category={0} and shipyard_id={1}", "Tugboats Details",shipyard.getId());
        List<FacilityDetail> tugboats=facilityDetailService.selectList(ew1);
        map.put("tugboats",tugboats);

        //查看设施信息的中的起其他信息
        EntityWrapper<FacilityDetail> ew2 = getEntityWrapper();
        ew2.addFilter("faci_category={0} and shipyard_id={1}", "Others",shipyard.getId());
        List<FacilityDetail> others=facilityDetailService.selectList(ew2);
        map.put("others",others);
        return "go/shipyard/info";
    }




    //ajax查看码头信息
    @RequestMapping(value = "/wharf")
    @ResponseBody
    public JSONObject wharfList(WharfDetail wharfDetail,@RequestParam(required = false) Integer id) {
        JSONObject jsonObject=new JSONObject();
        EntityWrapper<WharfDetail> ew = getEntityWrapper();
        ew.addFilter("shipyard_id={0}", id);
        List<WharfDetail> wharfDetails=wharfDetailService.selectList(ew);
        jsonObject.put("data",wharfDetails);
        return jsonObject;
    }

    //ajax查看泊位信息
    @RequestMapping(value = "/berth")
    @ResponseBody
    public JSONObject berthList(BerthDetail berthDetail, @RequestParam(required = false) Integer id) {
        JSONObject jsonObject=new JSONObject();
        EntityWrapper<BerthDetail> ew = getEntityWrapper();
        ew.addFilter("shipyard_id={0}", id);
        List<BerthDetail> berthDetails=berthDetailService.selectList(ew);
        jsonObject.put("data",berthDetails);
        return jsonObject;
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam(required = false) Integer id, ModelMap map) {
        PrivateShipyard privateShipyard = privateShipyardService.selectById(id);
        map.put("privateShipyard", privateShipyard);
        return "go/shipyard/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editComplete(PrivateShipyard privateShipyard) {
        JSONObject jsonObject = new JSONObject();
        if (privateShipyardService.updateById(privateShipyard)) {
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
        PrivateShipyard privateShipyard = privateShipyardService.selectById(id);
        privateShipyard.setDelFlag(Const.DEL_FLAG_DELETE);
        if (privateShipyardService.updateById(privateShipyard)) {
            jsonObject.put("status", 1);
        } else {
            jsonObject.put("status", 0);
            jsonObject.put("msg", "删除错误,请稍后再试");
        }
        return jsonObject;
    }



}