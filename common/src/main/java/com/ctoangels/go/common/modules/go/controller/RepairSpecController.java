package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import com.ctoangels.go.common.util.DateUtil;
import com.ctoangels.go.common.util.ItemId;
import com.ctoangels.go.common.util.MailUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.imageio.ImageIO;
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import java.awt.image.BufferedImage;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * RepairSpec 控制层
 */
@Controller
@RequestMapping("repairSpec")
public class RepairSpecController extends BaseController {
    @Autowired
    private IRepairSpecService repairSpecService;

    @Autowired
    private IRepairSpecItemService repairSpecItemService;

    @Autowired
    private IRepairModelItemService repairModelItemService;

    @Autowired
    private IRepairModelDetailService repairModelDetailService;

    @Autowired
    private IRepairSpecDetailService repairSpecDetailService;

    @Autowired
    private IRepairSpecDetailReqService repairSpecDetailReqService;

    @Autowired
    private ICompanyService companyService;

    @Autowired
    private IDictService dictService;

    @Autowired
    private IShipService shipService;


    @Autowired
    private IRepairSpecDetailMediaService repairSpecDetailMediaService;

    @RequestMapping
    public String page() {
        return "go/repairSpec/list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(RepairSpec repairSpec, @RequestParam(required = false) String keyword,Map map) {
        int companyId = getCurrentUser().getCompanyId();
        EntityWrapper<RepairSpec> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.like("ship_name", keyword);
        ew.setSqlSelect("id,ship_name,order_no,type,company_name,create_date,create_by,plan_start_date,plan_days,plan_cost");
        ew.addFilter("company_id={0}", companyId);
        ew.orderBy("update_date", false);
        Page<RepairSpec> page = repairSpecService.selectPage(getPage(), ew);
        /*for (RepairSpec spec : page.getRecords()) {
            spec.setType(dictService.getDesByTypeAndValue("维修类型", spec.getType()));
        }*/
        return jsonPage(page);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap map) {
        Integer modelId = 1;
        Integer companyId = getCurrentUser().getCompanyId();
        String companyName = companyService.selectById(companyId).getName();
        Locale locale = LocaleContextHolder.getLocale();
        String language=locale.getDisplayLanguage();
        List<Dict> cataList=null;
        if(language.equals("中文")||language.equals("Chinese")){
            cataList= dictService.getListByType("维修工程大类",Const.MESSAGE_ZH);
            map.put("typeList", dictService.getListByType("维修类型",Const.MESSAGE_ZH));
        }else if (language.equals("英文")||language.equals("English")){
            cataList= dictService.getListByType("维修工程大类",Const.MESSAGE_EN);
            map.put("typeList", dictService.getListByType("维修类型",Const.MESSAGE_EN));
        }



        List<Ship> shipList = shipService.getListByCompanyId(companyId);
        map.put("modelId", modelId);
        map.put("companyId", companyId);
        map.put("companyName", companyName);
        map.put("shipList", shipList);
        map.put("cataList", cataList);
        return "go/repairSpec/add";
    }

    //    @RequestMapping(value = "/getModelItem", method = RequestMethod.GET)
//    @ResponseBody
//    public JSONArray getModelItemList(String catagory) {
//        Integer modelId = 1;
//        List<RepairModelItem> list = repairModelItemService.byModelIdAndCatagoryContainParams(modelId, catagory);
//        SerializerFeature feature = SerializerFeature.DisableCircularReferenceDetect;
//        String a = JSON.toJSONString(list, feature);
//        JSONArray jsonArray = JSONArray.parseArray(a);
//        return jsonArray;
//    }
//
    @RequestMapping(value = "/getModelDetailList", method = RequestMethod.GET)
    @ResponseBody
    public List<RepairModelDetail> getModelDetailList() {
        List<RepairModelDetail> repairModelDetailList = repairModelDetailService.getListByCompanyId(getCurrentUser().getCompanyId());
        return repairModelDetailList;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(RepairSpec repairSpec) {
        JSONObject jsonObject = new JSONObject();
        repairSpec.setCreateDate(new Date());
        repairSpec.setCreateBy(getCurrentUser().getName());
        repairSpec.setUpdateDate(new Date());
        repairSpec.setUpdateBy(getCurrentUser().getName());
        repairSpec.setDelFlag(Const.DEL_FLAG_NORMAL);
        if (repairSpecService.saveRepairSpec(repairSpec)) {
            jsonObject.put("success", true);
            jsonObject.put("specId", repairSpec.getId());
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }


//    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    @ResponseBody
//    public JSONObject add(RepairSpec repairSpec,
//                          RepairSpecItemList specItems, Integer[] repairDetailId) {
//        JSONObject jsonObject = new JSONObject();
//        repairSpec.setCreateDate(new Date());
//        repairSpec.setCreateBy(getCurrentUser().getName());
//        repairSpec.setUpdateDate(new Date());
//        repairSpec.setUpdateBy(getCurrentUser().getName());
//        repairSpec.setDelFlag(Const.DEL_FLAG_NORMAL);
//        if (repairSpecService.saveRepairSpec(repairSpec, specItems, repairDetailId)) {
//            jsonObject.put("success", true);
//        } else {
//            jsonObject.put("success", false);
//            jsonObject.put("msg", "添加时出错,请稍后再试");
//        }
//        return jsonObject;
//    }

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String info(@RequestParam(required = false) Integer id, ModelMap map) {
        Locale locale = LocaleContextHolder.getLocale();
        String language=locale.getDisplayLanguage();

        RepairSpec repairSpec = repairSpecService.selectById(id);
        List<Dict> cataList=null;
        if(language.equals("中文")||language.equals("Chinese")){
            repairSpec.setType(dictService.getDesByTypeAndValue("维修类型", repairSpec.getType(),Const.MESSAGE_ZH));
            cataList= dictService.getListByType("维修工程大类",Const.MESSAGE_ZH);
            map.put("typeList", dictService.getListByType("维修类型",Const.MESSAGE_ZH));
        }else if (language.equals("英文")||language.equals("English")){
            repairSpec.setType(dictService.getDesByTypeAndValue("维修类型", repairSpec.getType(),Const.MESSAGE_EN));
            cataList= dictService.getListByType("维修工程大类",Const.MESSAGE_EN);
            map.put("typeList", dictService.getListByType("维修类型",Const.MESSAGE_EN));
        }

        map.put("repairSpec", repairSpec);
        map.put("cataList", cataList);
        return "go/repairSpec/info";
    }

    @RequestMapping(value = "/getSpecInfoItem", method = RequestMethod.GET)
    @ResponseBody
    public JSONArray getSpecInfoItem(String catagory, Integer specId, Integer modelId) {
        JSONArray jsonArray = null;
        SerializerFeature feature = SerializerFeature.DisableCircularReferenceDetect;
        Locale locale = LocaleContextHolder.getLocale();
        String language=locale.getDisplayLanguage();
        if (!"通用服务".equals(catagory)) {
            List<RepairSpecDetail> list=repairSpecDetailService.getListBySpecIdAndCatagory(specId, catagory);
            String a = JSON.toJSONString(list, feature);
            jsonArray = JSONArray.parseArray(a);
        } else {
            List<RepairSpecItem> list = null;
            if(language.equals("中文")||language.equals("Chinese")){
                list = repairSpecItemService.bySpecIdAndCatagoryForInfo(specId, "通用服务", modelId,Const.MESSAGE_ZH);
            }else if (language.equals("英文")||language.equals("English")){
                list = repairSpecItemService.bySpecIdAndCatagoryForInfo(specId, "通用服务", modelId,Const.MESSAGE_EN);
            }
            String a = JSON.toJSONString(list, feature);
            jsonArray = JSONArray.parseArray(a);
        }
        return jsonArray;
    }

    @RequestMapping(value = "/enquiry", method = RequestMethod.GET)
    public String enquiry(@RequestParam(required = false) Integer id, ModelMap map) {
        RepairSpec repairSpec = repairSpecService.selectById(id);
        map.put("repairSpec", repairSpec);
        return "go/repairSpec/enquiry";
    }

    @RequestMapping(value = "/enquiry", method = RequestMethod.POST)
    public JSONObject enquiryComplete(@RequestParam(required = false) MultipartFile[] files) {
        JSONObject jsonObject = new JSONObject();
        List<File> fileList = new ArrayList<>();
        File filefile;
        for (MultipartFile file : files) {
            try {
                filefile = new File(file.getOriginalFilename());
                file.transferTo(filefile);
                fileList.add(filefile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        MailUtil.sendEnquiryEmail("1061147291@qq.com", "试发带附件的邮件", fileList);
        return jsonObject;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam(required = false) Integer id, ModelMap map) {
        RepairSpec repairSpec = repairSpecService.selectById(id);
        map.put("repairSpec", repairSpec);
        Locale locale=LocaleContextHolder.getLocale();
        String language=locale.getDisplayLanguage();
        List<Dict> cataList=null;
        if(language.equals("中文")||language.equals("Chinese")){
            cataList = dictService.getListByType("维修工程大类",Const.MESSAGE_ZH);
            map.put("typeList", dictService.getListByType("维修类型",Const.MESSAGE_ZH));
        }else if (language.equals("英文")||language.equals("English")){
            cataList = dictService.getListByType("维修工程大类",Const.MESSAGE_EN);
            map.put("typeList", dictService.getListByType("维修类型",Const.MESSAGE_EN));
        }

        map.put("catagory", cataList);
        map.put("nextProNoList", repairSpecDetailService.getNextProNo(id));
        return "go/repairSpec/edit";
    }

    @RequestMapping(value = "/getSpecItem", method = RequestMethod.GET)
    @ResponseBody
    public JSONArray getSpecItemList(String catagory, Integer specId, Integer modelId) {
        Locale locale = LocaleContextHolder.getLocale();
        String language=locale.getDisplayLanguage();
        List<RepairSpecItem> list=null;
        if(language.equals("中文")||language.equals("Chinese")){
            list= repairSpecItemService.bySpecIdAndCatagoryWithParamsAndValue(specId, catagory, modelId,Const.MESSAGE_ZH);
        }
        if (language.equals("英文")||language.equals("English")){
            list= repairSpecItemService.bySpecIdAndCatagoryWithParamsAndValue(specId, catagory, modelId,Const.MESSAGE_EN);
        }

        SerializerFeature feature = SerializerFeature.DisableCircularReferenceDetect;
        String a = JSON.toJSONString(list, feature);
        JSONArray jsonArray = JSONArray.parseArray(a);
        return jsonArray;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject edit(RepairSpec repairSpec,
                           RepairSpecItemList specItems, Integer[] repairDetailId, Integer[] deleteItemId) {
        JSONObject jsonObject = new JSONObject();
        repairSpec.setUpdateDate(new Date());
        repairSpec.setUpdateBy(getCurrentUser().getName());
        Map<String, Object> result = repairSpecService.updateRepairSpec(repairSpec, specItems, repairDetailId, deleteItemId);
        if ((boolean) result.get("success")) {
            jsonObject.put("success", true);
            jsonObject.put("idList", (List<ItemId>) result.get("idList"));
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
        RepairSpec repairSpec = repairSpecService.selectById(id);
        repairSpec.setDelFlag(Const.DEL_FLAG_DELETE);
        if (repairSpecService.updateById(repairSpec)) {
            jsonObject.put("status", 1);
        } else {
            jsonObject.put("status", 0);
            jsonObject.put("msg", "删除错误,请稍后再试");
        }
        return jsonObject;
    }

    //发送工程单excel
    @RequestMapping(value = "/exportExcel", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject exportRepairSpecExcel(Integer id, String toAddress) {
        JSONObject jsonObject = new JSONObject();
        String errInfo = "";
        String regex = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(toAddress);
        Boolean flag = m.matches();
        if (flag) {
            try {
                MailUtil.sendSpecExcelEmail(toAddress, "工程单", exportSpecExcel(id));
            } catch (Exception e) {
                e.printStackTrace();
                jsonObject.put("result", "nothing");
                return jsonObject;
            }
            errInfo = "success";
        } else {
            errInfo = "email error";
        }
        jsonObject.put("result", errInfo);
        return jsonObject;
    }

    //导出工程单excel
    public File exportSpecExcel(Integer specId) throws Exception {
        RepairSpec spec = repairSpecService.selectById(specId);
        Integer shipId = spec.getShipId();
        Ship ship = shipService.selectById(shipId);
        List<RepairSpecDetail> detailList = null;
        String excelName = spec.getName() != null ? spec.getName() : spec.getShipName() + "工程单概述";


        Locale locale = LocaleContextHolder.getLocale();
        String language=locale.getDisplayLanguage();
        File modelExcel=null;
        if(language.equals("中文")||language.equals("Chinese")){
            modelExcel = new File(getClass().getClassLoader().getResource("detailModel_zh.xls").getFile());
        }
        if (language.equals("英文")||language.equals("English")){
            modelExcel = new File(getClass().getClassLoader().getResource("detailModel_en.xls").getFile());
        }
        FileInputStream is = null; //文件流
        HSSFWorkbook wb = null;
        try {
            is = new FileInputStream(modelExcel);
            wb = new HSSFWorkbook(is);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        //船舶信息表
        HSSFSheet shipSheet = wb.getSheetAt(1);
        //船舶概要信息
        shipSheet.getRow(1).getCell(2).setCellValue(ship.getName());//船名
        shipSheet.getRow(1).getCell(5).setCellValue(ship.getBuilder());//建造船厂
        shipSheet.getRow(2).getCell(2).setCellValue(ship.getImo());//imo
        if (ship.getBuildYear() != null) {
            shipSheet.getRow(2).getCell(5).setCellValue(DateUtil.formatDate(ship.getBuildYear()));//建造日期
        }
        shipSheet.getRow(3).getCell(2).setCellValue(ship.getShipClass());//船级社
        shipSheet.getRow(3).getCell(5).setCellValue(ship.getCallSign());//船舶呼号
        shipSheet.getRow(4).getCell(2).setCellValue(ship.getType());//船舶类型
        //船体信息
//        HSSFCell shipCell = null;
        shipSheet.getRow(6).getCell(2).setCellValue(ship.getLoa());//船长
        shipSheet.getRow(6).getCell(5).setCellValue(ship.getDraft());//吃水
        shipSheet.getRow(7).getCell(2).setCellValue(ship.getBeam());//船宽
        shipSheet.getRow(7).getCell(5).setCellValue(ship.getDwt());//载重吨
        shipSheet.getRow(8).getCell(2).setCellValue(ship.getDepth());//型深
        shipSheet.getRow(8).getCell(5).setCellValue(ship.getGrt());//注册总吨
        shipSheet.getRow(9).getCell(2).setCellValue(ship.getDd());//坞检
        shipSheet.getRow(9).getCell(5).setCellValue(ship.getSs());//特检
//        //设备信息
//        //主机
        shipSheet.getRow(12).getCell(2).setCellValue(ship.getMeMaker());//厂家
        shipSheet.getRow(12).getCell(5).setCellValue(ship.getMeType());//型号
        shipSheet.getRow(13).getCell(2).setCellValue(ship.getMeBhpRpm());//马力/转速
        shipSheet.getRow(13).getCell(5).setCellValue(ship.getMeQty());//数量
        shipSheet.getRow(14).getCell(2).setCellValue(ship.getMeCylBore());//缸径
//        //辅机
//        shipSheet.getRow(16).getCell(2).setCellValue(ship.getAuxMaker());//厂家
//        shipSheet.getRow(16).getCell(5).setCellValue(ship.getAuxType());//型号
//        shipSheet.getRow(17).getCell(2).setCellValue(ship.getAuxRatedOr());//额定功率
//        shipSheet.getRow(17).getCell(5).setCellValue(ship.getAuxQty());//数量
//        shipSheet.getRow(18).getCell(2).setCellValue(ship.getAuxCylBore());//缸径
//        //锅炉
//        shipSheet.getRow(20).getCell(2).setCellValue(ship.getBoilerMaker());//厂家
//        shipSheet.getRow(20).getCell(5).setCellValue(ship.getBoilerType());//型号
//        shipSheet.getRow(21).getCell(2).setCellValue(ship.getBoilerPressure());//工作压力
//        shipSheet.getRow(21).getCell(5).setCellValue(ship.getBoilerQty());//数量
//        shipSheet.getRow(22).getCell(2).setCellValue(ship.getBoilerHeatingArea());//热交换面积
//        shipSheet.getRow(22).getCell(5).setCellValue(ship.getBoilerEvaporation());//蒸发量
        /*单元格自动换行*/
        HSSFCellStyle s=wb.createCellStyle();
        s.setWrapText(true);

        List<Dict> dictList = null;
        dictList=dictService.getListByType("维修工程大类",Const.MESSAGE_ZH);
        for (Dict dict : dictList) {
            int catagoryRowNum = 0;
            String catagory = dict.getDes();
            HSSFSheet sheet=null;
            HSSFRow row=null;
            HSSFCell cell=null;
            if (!"通用服务".equals(catagory) ) {
                    detailList = repairSpecDetailService.getListBySpecIdAndCatagory(specId, catagory);

                if (detailList == null || detailList.size() == 0) {
                    continue;
                }

                if(language.equals("中文")||language.equals("Chinese")){
                    sheet= wb.createSheet(catagory);
                    sheet.setColumnWidth(1, 50 * 256);
                    row = sheet.createRow((int) catagoryRowNum++);
                    cell = row.createCell((short) 0);

                    row.createCell((short) 0).setCellValue("工程单号");
                    row.createCell((short) 1).setCellValue("要求描述/材料规格");
                    row.createCell((short) 2).setCellValue("单位");
                    row.createCell((short) 3).setCellValue("数量");
                    row.createCell((short) 4).setCellValue("单价");
                    row.createCell((short) 5).setCellValue("总价");
                    row.createCell((short) 6).setCellValue("备注");
                } else if (language.equals("英文")||language.equals("English")){
                    sheet= confirmCatagory(wb,catagory);
                    sheet.setColumnWidth(1, 50 * 256);
                    row = sheet.createRow((int) catagoryRowNum++);
                    cell = row.createCell((short) 0);

                    row.createCell((short) 0).setCellValue("Project bill number");
                    row.createCell((short) 1).setCellValue("Requirement and description / material spec");
                    row.createCell((short) 2).setCellValue("Unit");
                    row.createCell((short) 3).setCellValue("Quantity");
                    row.createCell((short) 4).setCellValue("Unit price");
                    row.createCell((short) 5).setCellValue("Total price");
                    row.createCell((short) 6).setCellValue("Remark");
                }


                HSSFCellStyle linkStyle = wb.createCellStyle();
                HSSFFont cellFont = wb.createFont();
                cellFont.setUnderline((byte) 1);
                cellFont.setColor(HSSFColor.BLUE.index);
                linkStyle.setFont(cellFont);

                for (RepairSpecDetail detail : detailList) {
                    row = sheet.createRow((int) catagoryRowNum++);
                    // 第四步，创建单元格，并设置值
                    String proOrderNo = detail.getProOrderNo();
                    cell = row.createCell((short) 0);
                    cell.setCellFormula("HYPERLINK(\"" + "#'" + proOrderNo + "'!A1" + "\",\"" + proOrderNo + "\")");
                    cell.setCellStyle(linkStyle);
                    row.createCell((short) 1).setCellValue("工程名称:" + detail.getProName());

                    RepairSpecDetailReq req = new RepairSpecDetailReq();
                    req.setRepairSpecDetailId(detail.getId());
                    List<RepairSpecDetailReq> reqList = repairSpecDetailReqService.selectList(new EntityWrapper<>(req));
                    for (RepairSpecDetailReq r : reqList) {
                        row = sheet.createRow((int) catagoryRowNum++);
                        row.createCell((short) 1).setCellValue(r.getDes());
                        row.createCell((short) 2).setCellValue(r.getUnit());
                        row.createCell((short) 3).setCellValue(r.getCount());

                        row.getCell(1).setCellStyle(s);

                    }
                    row = sheet.createRow((int) catagoryRowNum++);
                }
            } else {
                List<RepairSpecItem> itemList=null;
                if(language.equals("中文")||language.equals("Chinese")){
                    itemList= repairSpecItemService.bySpecIdAndCatagoryForInfo(specId, catagory, spec.getModelId(),Const.MESSAGE_ZH);
                }
                else if(language.equals("英文")||language.equals("English")){
                    itemList= repairSpecItemService.bySpecIdAndCatagoryForInfo(specId, catagory, spec.getModelId(),Const.MESSAGE_EN);
                }

                if (itemList == null || itemList.size() == 0) {
                    continue;
                }

                if(language.equals("中文")||language.equals("Chinese")){
                    sheet = wb.createSheet(catagory);
                    sheet.setColumnWidth(1, 50 * 256);
                    sheet.setColumnWidth(4, 30 * 256);

                    row = sheet.createRow((int) 0);
                    row.createCell((short) 0).setCellValue("项目号");
                    row.createCell((short) 1).setCellValue("维修内容");
                    row.createCell((short) 2).setCellValue("单位");
                    row.createCell((short) 3).setCellValue("数量");
                    row.createCell((short) 4).setCellValue("单价");
                    row.createCell((short) 5).setCellValue("总价");
                    row.createCell((short) 6).setCellValue("备注");
                }else if (language.equals("英文")||language.equals("English")){
                    sheet = wb.createSheet("General Service");
                    sheet.setColumnWidth(1, 50 * 256);
                    sheet.setColumnWidth(4, 30 * 256);
                    row = sheet.createRow((int) 0);
                    row.createCell((short) 0).setCellValue("Project number");
                    row.createCell((short) 1).setCellValue("Maintenance capacity");
                    row.createCell((short) 2).setCellValue("Unit");
                    row.createCell((short) 3).setCellValue("Quantity");
                    row.createCell((short) 4).setCellValue("Unit price");
                    row.createCell((short) 5).setCellValue("Total price");
                    row.createCell((short) 6).setCellValue("Remark");
                }


                for (RepairSpecItem item : itemList) {
                    row = sheet.createRow(sheet.getLastRowNum() + 1);
                    row.createCell((short) 0).setCellValue(item.getCode());
                    row.createCell((short) 1).setCellValue(item.getContent());
                    row.createCell((short) 2).setCellValue(item.getUnit());
                    row.getCell(1).setCellStyle(s);//单元格自动换行
                    if (item.getCount() != null) {
                        row.createCell((short) 3).setCellValue(item.getCount());
                    }
                    row.createCell((short) 4).setCellValue(item.getRemark());
                    List<Param> paramList = item.getParamList();
                    if (paramList != null) {
                        Class clazz = item.getClass();
                        Method m = null;
                        Param param = null;
                        for (int n = 0; n < paramList.size(); n++) {
                            param = paramList.get(n);
                            row = sheet.createRow(sheet.getLastRowNum() + 1);
                            try {
                                m = clazz.getDeclaredMethod("getParam" + (n + 1) + "Val");
                                String name = param.getName();
                                name = name == null ? "" : name;
                                String str = (String) m.invoke(item);
                                str = str == null ? "" : str;
                                String unit = param.getUnit();
                                unit = unit == null ? "" : unit;
                                row.createCell((short) 1).setCellValue(name + str + unit);
                            } catch (NoSuchMethodException e) {
                                e.printStackTrace();
                            } catch (InvocationTargetException e) {
                                e.printStackTrace();
                            } catch (IllegalAccessException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
        }

        //获取填表人的角色
        List<Dict> preparerRoles=dictService.selectByType("填表人角色");
        List<Dict> directorRoles=dictService.selectByType("主管角色");
        for (Dict dict : dictList) {
            String catagory = dict.getDes();
            detailList = repairSpecDetailService.getListBySpecIdAndCatagory(specId, catagory);
            for (RepairSpecDetail detail : detailList) {
                HSSFSheet detailSheet = wb.cloneSheet(0);
                String proOrderNo = detail.getProOrderNo();
                int sheetIndex = wb.getSheetIndex(detailSheet);
                wb.setSheetName(sheetIndex, proOrderNo);
                detailSheet.getRow(0).getCell(2).setCellValue(detail.getShipName());//船名
                detailSheet.getRow(0).getCell(6).setCellValue(detail.getCatagory());//维修大类
                detailSheet.getRow(0).getCell(10).setCellValue(detail.getCode());//item code
                detailSheet.getRow(0).getCell(14).setCellValue(detail.getProOrderNo());//维修单号
                detailSheet.getRow(4).getCell(1).setCellValue(detail.getProName());//工程名称
                detailSheet.getRow(5).getCell(1).setCellValue(detail.getProDesc());//工程描述
                detailSheet.getRow(4).getCell(11).setCellValue(detail.getFaciName());//设备名称
                detailSheet.getRow(5).getCell(11).setCellValue(detail.getFaciType());//设备型号
                detailSheet.getRow(6).getCell(11).setCellValue(detail.getFaciSrc());//设备来源 厂家/国家
                detailSheet.getRow(8).getCell(11).setCellValue(detail.getFaciParam());//设备相关参数
                detailSheet.getRow(17).getCell(1).setCellValue(detail.getRepairPositionDesc());//维修详细位置
                detailSheet.getRow(31).getCell(2).setCellValue(detail.getDamage());//损坏程度
                detailSheet.getRow(28).getCell(1).setCellValue(detail.getRepairTechDesc());//修理工艺描述

                for(Dict d:preparerRoles){
                    if(Integer.parseInt(d.getValue())==detail.getPreparerRole()){
                        detailSheet.getRow(39).getCell(1).setCellValue(d.getDes());//填表人角色
                        detailSheet.getRow(39).getCell(3).setCellValue(detail.getPreparer());//填表人
                    }
                }
                for(Dict d1:directorRoles){
                    if(Integer.parseInt(d1.getValue())==detail.getDirectorRole()){
                        detailSheet.getRow(40).getCell(1).setCellValue(d1.getDes());//主管角色
                        detailSheet.getRow(40).getCell(3).setCellValue(detail.getDirector());//船员主管
                    }
                }

                detailSheet.getRow(41).getCell(1).setCellValue(detail.getDirector());//机务

                //维修部位
                List<Dict> dictList1=dictService.selectByType("维修部位");
                String[] posList = new String[0];
                if (detail.getRepairPosition() != null) {
                    posList = detail.getRepairPosition().split(",");
                }

                int posRow = 13;
                int posCol = 0;
                String iValue;
                String rValue;
                String iDes;
                for (int i = 0; i < dictList1.size(); i++) {
                    iValue = dictList1.get(i).getValue();
                    iDes = dictList1.get(i).getDes();
                    int r;
                    for (r = 0; r < posList.length; r++) {
                        rValue = posList[r];
                        if (iValue.equals(rValue)) {
                            detailSheet.getRow(posRow).getCell(posCol).setCellValue(iDes);
                            posCol += 2;
                            break;
                        }
                    }
                    if (posCol == 10) {
                        posRow++;
                        posCol = 0;
                    }
                }

                //修理工艺
                List<Dict> dictList2=dictService.selectByType("修理工艺");
                String[] techList = new String[0];
                if (detail.getRepairTech() != null) {
                    techList = detail.getRepairTech().split(",");
                }
                int techRow = 23;
                int techCol = 0;
                for (int i = 0; i < dictList2.size(); i++) {
                    iValue = dictList2.get(i).getValue();
                    iDes = dictList2.get(i).getDes();
                    int r;
                    for (r = 0; r < techList.length; r++) {
                        rValue = techList[r];
                        if (iValue.equals(rValue)) {
                            detailSheet.getRow(techRow).getCell(techCol).setCellValue(iDes);
                            techCol += 2;
                            break;
                        }
                    }

                    if (techCol == 10) {
                        techRow++;
                        techCol = 0;
                    }
                }

                RepairSpecDetailReq req = new RepairSpecDetailReq();
                req.setRepairSpecDetailId(detail.getId());
                List<RepairSpecDetailReq> reqList = repairSpecDetailReqService.selectList(new EntityWrapper<>(req));
                int startRow = 46;
                for (RepairSpecDetailReq r : reqList) {
                    HSSFRow reqRow = detailSheet.getRow(startRow++);
                    reqRow.getCell(0).setCellStyle(s);
                    reqRow.getCell(0).setCellValue(r.getDes());//要求和描述/材料
                    reqRow.getCell(9).setCellValue(r.getUnit());//单位
                    reqRow.getCell(13).setCellValue(r.getCount());//数量
                }

                //获取详单的图片信息
                EntityWrapper<RepairSpecDetailMedia> ew=new EntityWrapper<>();
                ew.addFilter("repair_spec_detail_id={0}",detail.getId());
                List<RepairSpecDetailMedia> medias=repairSpecDetailMediaService.selectList(ew);
                int row=0;
                if(medias.size()>0){
                    for(RepairSpecDetailMedia media:medias){
                        URL url=new URL(media.getOss());
                        HttpURLConnection conn= (HttpURLConnection) url.openConnection();//打开链接
                        conn.setRequestMethod("GET");//设置请求方式
                        conn.setConnectTimeout(5*1000);//设置超时响应时间
                        InputStream inputStream=conn.getInputStream();//通过输入流获取图片数据
                        byte[] data=readInputStream(inputStream);
                        HSSFPatriarch patriarch=detailSheet.createDrawingPatriarch();
                        HSSFClientAnchor anchor=new HSSFClientAnchor(0,0,1023,250,(short)9,16+row,(short) 15,23+row);
                        row+=9;
                        anchor.setAnchorType(2);
                        patriarch.createPicture(anchor,wb.addPicture(data,HSSFWorkbook.PICTURE_TYPE_JPEG));

                    }
                }
            }
        }

        wb.removeSheetAt(0);
        wb.setActiveSheet(0);

        // 第六步，将文件存到指定位置
        try {
            FileOutputStream fout = new FileOutputStream(excelName + ".xls");
            wb.write(fout);
            fout.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        File excel = new File(excelName + ".xls");
        return excel;
    }


    private HSSFSheet confirmCatagory(HSSFWorkbook wb,String catagory){
        HSSFSheet sheet=null;
        if(catagory.equals("坞修工程")){
            sheet= wb.createSheet("Dock Project");
        }else if (catagory.equals("船体工程")){
            sheet= wb.createSheet("Hull Project");
        }else if (catagory.equals("机械工程")){
            sheet= wb.createSheet("Machinery Project");
        }else if (catagory.equals("电气工程")){
            sheet= wb.createSheet("Electical Project");
        }else if (catagory.equals("冷藏工程")){
            sheet= wb.createSheet("Refrigeration Project");
        }else if (catagory.equals("特种设备")){
            sheet= wb.createSheet("Special Equipment");
        }else if (catagory.equals("其他")){
            sheet= wb.createSheet("Others");
        }


        return sheet;
    }
    private static byte[] readInputStream(InputStream inStream) throws Exception{
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        //创建一个Buffer字符串
        byte[] buffer = new byte[1024];
        //每次读取的字符串长度，如果为-1，代表全部读取完毕
        int len = 0;
        //使用一个输入流从buffer里把数据读取出来
        while( (len=inStream.read(buffer)) != -1 ){
            //用输出流往buffer里写入数据，中间参数代表从哪个位置开始读，len代表读取的长度
            outStream.write(buffer, 0, len);
        }
        //关闭输入流
        inStream.close();
        //把outStream里的数据写入内存
        return outStream.toByteArray();
    }
}


//插入图片
//            BufferedImage bufferImg = null;
//            ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
//            try {
//                bufferImg = ImageIO.read(new File("F:/15.jpg"));
//                ImageIO.write(bufferImg, "jpg", byteArrayOut);
//                //画图的顶级管理器，一个sheet只能获取一个（一定要注意这点）
//                HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
//                //anchor主要用于设置图片的属性
//                HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 255, 255, (short) 1, 1, (short) 5, 8);
//                anchor.setAnchorType(3);
//                //插入图片
//                patriarch.createPicture(anchor, wb.addPicture(byteArrayOut.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));
//
//            } catch (IOException e) {
//                e.printStackTrace();
//            }