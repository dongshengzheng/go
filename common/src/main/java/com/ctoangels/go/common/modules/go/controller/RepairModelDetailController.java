package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.Dict;
import com.ctoangels.go.common.modules.go.entity.RepairModelDetail;
import com.ctoangels.go.common.modules.go.entity.RepairModelDetailReq;
import com.ctoangels.go.common.modules.go.entity.Ship;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * RepairModelDetail 控制层
 */
@Controller
@RequestMapping("modelDetail")
public class RepairModelDetailController extends BaseController {

    @Autowired
    private IRepairSpecDetailReqService repairSpecDetailReqService;

    @Autowired
    private IRepairSpecDetailService repairSpecDetailService;

    @Autowired
    private IDictService dictService;


    @Autowired
    private IRepairModelDetailReqService repairModelDetailReqService;


    @Autowired
    private IRepairModelDetailService repairModelDetailService;

    @RequestMapping
    public String page() {
        return "go/modelDetail/list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(RepairModelDetail repairModelDetail, @RequestParam(required = false) String keyword) {
        int companyId = getCurrentUser().getCompanyId();
        EntityWrapper<RepairModelDetail> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.like("proName", keyword);
        ew.addFilter("company_id={0}", companyId);
        Page<RepairModelDetail> page = repairModelDetailService.selectPage(getPage(), ew);
        return jsonPage(page);
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(HttpSession session) {
        EntityWrapper<Dict> ew = new EntityWrapper<>();
        ew.addFilter("type={0}", "维修部位");
        List<Dict> repDicts = dictService.selectList(ew);

        EntityWrapper<Dict> ew1 = new EntityWrapper<>();
        ew1.addFilter("type={0}", "修理工艺");
        List<Dict> reqDicts = dictService.selectList(ew1);

        session.setAttribute("repDicts",repDicts);
        session.setAttribute("reqDicts",reqDicts);
        return "go/modelDetail/add";
    }

    /*保存为维修工程单范本*/
    @RequestMapping(value = "/addModel", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addModel(RepairModelDetail repairModelDetail, @RequestParam(required = false) String dataJson) {
        int companyId = getCurrentUser().getCompanyId();
        repairModelDetail.setCompanyId(companyId);

        JSONObject jsonObject = new JSONObject();
        List<RepairModelDetailReq> modelReqs = new ArrayList<>();
        RepairModelDetailReq modelReq = new RepairModelDetailReq();
        String[] array = dataJson.split(",");

        repairModelDetail.setDelFlag(Const.DEL_FLAG_NORMAL);

        if (repairModelDetailService.insert(repairModelDetail)) {
            int id = repairModelDetail.getId();
            for (int i = 0; i < array.length; i++) {
                if (i % 3 == 0) {
                    modelReq.setDes(array[i]);
                } else if (i % 3 == 1) {
                    modelReq.setUnit(array[i]);
                } else if (i % 3 == 2) {
                    modelReq.setCount(array[i]);
                    modelReq.setRepairModelDetailId(id);
                    modelReqs.add(modelReq);
                    modelReq = new RepairModelDetailReq();
                }
            }
            repairModelDetailReqService.insertBatch(modelReqs);

            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }

    @RequestMapping(value = "info" ,method =RequestMethod.GET)
    public String info(@RequestParam Integer id, Model model){

        RepairModelDetail repairModelDetail=repairModelDetailService.selectById(id);
        model.addAttribute("modelDetails",repairModelDetail);

        EntityWrapper<RepairModelDetailReq> ew = new EntityWrapper<>();
        ew.addFilter("repair_model_id", repairModelDetail.getId());
        List<RepairModelDetailReq> repairModelDetailReqs=repairModelDetailReqService.selectList(ew);
        return "go/modelDetail/info";
    }

}