package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import com.ctoangels.go.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * RepairSpecDetail 控制层
 */
@Controller
@RequestMapping(value = "repairSpecDetail")
public class RepairSpecDetailController extends BaseController {
    @Autowired
    private IRepairSpecDetailService repairSpecDetailService;

    @Autowired
    private IRepairSpecDetailReqService repairSpecDetailReqService;

    @Autowired
    private IDictService dictService;

    @Autowired
    private IRepairModelDetailService repairModelDetailService;

    @Autowired
    private IRepairModelDetailReqService repairModelDetailReqService;

    @Autowired
    private IRepairSpecDetailMediaService repairSpecDetailMediaService;

    @Value("${static_path}")
    private String staticPath;

    /*在新增工程单模式下 新增维修范本或维修详单*/
    @RequestMapping(value = "/addModelDetail", method = RequestMethod.GET)
    public String add(ModelMap map, @RequestParam(required = false) Integer id) {
        if (id != null && id != 0) {
            RepairModelDetail detail = repairModelDetailService.selectById(id);
            List<RepairModelDetailReq> reqList = repairModelDetailReqService.getListByDetailId(id);
            map.put("detail", detail);
            String repairPosition = detail.getRepairPosition();
            if (!StringUtils.isEmpty(repairPosition)) {
                String[] positionList = repairPosition.split(",");
                map.put("positionList", positionList);
            }
            String repairTech = detail.getRepairTech();
            if (!StringUtils.isEmpty(repairTech)) {
                String[] techList = repairTech.split(",");
                map.put("techList", techList);
            }


            map.put("reqList", reqList);
        }
        map.put("repDicts", dictService.selectByType("维修部位"));
        map.put("reqDicts", dictService.selectByType("修理工艺"));
        map.put("preparerRoles",dictService.selectByType("填表人角色"));
        map.put("directorRoles",dictService.selectByType("主管角色"));

        map.put("staticPath", staticPath);
        return "go/repairSpec/detail";
    }

    /*保存为维修工程单范本*/
    @RequestMapping(value = "/addModelDetail", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addModel(RepairModelDetail repairModelDetail, @RequestParam(required = false) String dataJson) {
        repairModelDetail.setCompanyId(getCurrentUser().getCompanyId());
        JSONObject jsonObject = new JSONObject();
        List<RepairModelDetailReq> reqs = JSONObject.parseArray(dataJson, RepairModelDetailReq.class);

        repairModelDetail.setDelFlag(Const.DEL_FLAG_NORMAL);

        if (repairModelDetailService.insert(repairModelDetail)) {
            for (RepairModelDetailReq r : reqs) {
                r.setRepairModelDetailId(repairModelDetail.getId());
            }
            repairModelDetailReqService.deleteRepairModelDetailById(repairModelDetail.getId());
            repairModelDetailReqService.insertBatch(reqs);

            jsonObject.put("success", true);
            jsonObject.put("specDetail", false);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }


    /*保存为工程单的维修详单*/
    @RequestMapping(value = "/addSpecDetail", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(RepairSpecDetail repairSpecDetail,
                          @RequestParam(required = false) String dataJson,
                          @RequestParam(required = false) String fileName,
                          @RequestParam(required = false) String oss,
                          @RequestParam(required = false) String fileType) {
        JSONObject jsonObject = new JSONObject();
        repairSpecDetail.setDelFlag(Const.DEL_FLAG_NORMAL);
        List<RepairSpecDetailReq> reqs = JSONObject.parseArray(dataJson, RepairSpecDetailReq.class);
        if (repairSpecDetailService.insert(repairSpecDetail)) {
            int id = repairSpecDetail.getId();
            if (reqs.size() > 0) {
                for (RepairSpecDetailReq r : reqs) {
                    r.setRepairSpecDetailId(id);
                }
                repairSpecDetailReqService.deleteRepairSpecDetailReqById(repairSpecDetail.getId());
                repairSpecDetailReqService.insertBatch(reqs);
            }
            if (fileName != null) {
                String[] fileNames = fileName.split(",");
                String[] osss = oss.split(",");
                String[] fileTypes = fileType.split(",");

                List<RepairSpecDetailMedia> specDetailMedias = new ArrayList<>();
                for (int i = 0; i < fileNames.length; i++) {
                    RepairSpecDetailMedia specDetailMedia = new RepairSpecDetailMedia();
                    specDetailMedia.setFilename(fileNames[i]);
                    specDetailMedia.setOss(osss[i]);
                    specDetailMedia.setType(fileTypes[i]);
                    specDetailMedia.setRepairSpecDetailId(id);
                    specDetailMedias.add(specDetailMedia);
                }
                repairSpecDetailMediaService.deleteBySpecDetailId(repairSpecDetail.getId());
                repairSpecDetailMediaService.insertBatch(specDetailMedias);
            }

            jsonObject.put("success", true);
            jsonObject.put("specDetail", true);
            jsonObject.put("repairSpecDetailId", id);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }

    //查看和编辑维修详单
    @RequestMapping(value = "editSpecDetail", method = RequestMethod.GET)
    public String editSpecDetail(@RequestParam(required = false) Integer id, ModelMap map) {
        RepairSpecDetail detail = repairSpecDetailService.selectById(id);
        String repairPosition = detail.getRepairPosition();
        if (!StringUtils.isEmpty(repairPosition)) {
            String[] positionsList = repairPosition.split(",");
            map.put("positionList", positionsList);
        }
        String repairTech = detail.getRepairTech();
        if (!StringUtils.isEmpty(repairTech)) {
            String[] techList = repairTech.split(",");
            map.put("techList", techList);
        }
        //图片
        EntityWrapper<RepairSpecDetailMedia> ew3=new EntityWrapper<>();
        ew3.addFilter("repair_spec_detail_id={0}",detail.getId());
        List<RepairSpecDetailMedia> specDetailMedias =repairSpecDetailMediaService.selectList(ew3);
        map.put("specDetailMedias",specDetailMedias);
        map.put("size",specDetailMedias.size());


        map.put("detail", detail);
        EntityWrapper<RepairSpecDetailReq> ew = new EntityWrapper<>();
        ew.addFilter("repair_spec_detail_id={0}", detail.getId());
        List<RepairSpecDetailReq> repairSpecDetailReqs = repairSpecDetailReqService.selectList(ew);
        map.put("reqList", repairSpecDetailReqs);

        map.put("repDicts", dictService.selectByType("维修部位"));
        map.put("reqDicts", dictService.selectByType("修理工艺"));
        map.put("preparerRoles",dictService.selectByType("填表人角色"));
        map.put("directorRoles",dictService.selectByType("主管角色"));

        map.put("staticPath", staticPath);
        return "go/repairSpec/detail-edit";
    }

    /*更新维修详单*/
    @RequestMapping(value = "/editSpecDetail", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editSpecDetailComplete(RepairSpecDetail repairSpecDetail,
                                             @RequestParam(required = false) String dataJson,
                                             @RequestParam(required = false) String fileName,
                                             @RequestParam(required = false) String oss,
                                             @RequestParam(required = false) String fileType) {
        JSONObject jsonObject = new JSONObject();
        List<RepairSpecDetailReq> reqs = JSONObject.parseArray(dataJson, RepairSpecDetailReq.class);
        repairSpecDetail.setDelFlag(Const.DEL_FLAG_NORMAL);
        if (repairSpecDetailService.updateById(repairSpecDetail)) {
            int id = repairSpecDetail.getId();
            if (reqs.size() > 0) {

                for (RepairSpecDetailReq r : reqs) {
                    r.setRepairSpecDetailId(id);
                }
                repairSpecDetailReqService.deleteRepairSpecDetailReqById(id);
                repairSpecDetailReqService.insertBatch(reqs);
            }
            if (fileName != null) {
                String[] fileNames = fileName.split(",");
                String[] osss = oss.split(",");
                String[] fileTypes = fileType.split(",");

                List<RepairSpecDetailMedia> specDetailMedias = new ArrayList<>();
                for (int i = 0; i < fileNames.length; i++) {
                    RepairSpecDetailMedia specDetailMedia = new RepairSpecDetailMedia();
                    specDetailMedia.setFilename(fileNames[i]);
                    specDetailMedia.setOss(osss[i]);
                    specDetailMedia.setType(fileTypes[i]);
                    specDetailMedia.setRepairSpecDetailId(id);
                    specDetailMedias.add(specDetailMedia);
                }
                repairSpecDetailMediaService.deleteBySpecDetailId(repairSpecDetail.getId());
                repairSpecDetailMediaService.insertBatch(specDetailMedias);
            }
            jsonObject.put("success", true);
            jsonObject.put("specDetail", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "更新时出错,请稍后再试");
        }
        return jsonObject;
    }

    /*删除维修详单*/
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject editSpecDetailComplete(Integer id) {
        JSONObject jsonObject = new JSONObject();
        RepairSpecDetail detail = repairSpecDetailService.selectById(id);
        detail.setDelFlag(Const.DEL_FLAG_DELETE);
        if (repairSpecDetailService.updateById(detail)) {
            jsonObject.put("suc", true);
        } else {
            jsonObject.put("suc", false);
        }
        return jsonObject;
    }

    //获取DetailReq信息
    @RequestMapping(value = "/reqs", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject demo(@RequestParam(required = false) Integer id) {
        JSONObject jsonObject = new JSONObject();
        EntityWrapper<RepairSpecDetailReq> ew = new EntityWrapper<>();
        ew.addFilter("repair_spec_detail_id={0}", id);
        List<RepairSpecDetailReq> repairSpecDetailReqs = repairSpecDetailReqService.selectList(ew);
        jsonObject.put("reqs", repairSpecDetailReqs);
        return jsonObject;
    }
}