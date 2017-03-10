package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.*;
import com.ctoangels.go.common.modules.go.service.*;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

    @RequestMapping
    public String page() {
        return "go/repairSpec/list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(RepairSpec repairSpec, @RequestParam(required = false) String keyword) {
        int companyId = getCurrentUser().getCompanyId();
        EntityWrapper<RepairSpec> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.like("ship_name", keyword);
        ew.addFilter("company_id={0}", companyId);
        Page<RepairSpec> page = repairSpecService.selectPage(getPage(), ew);
        for (RepairSpec spec : page.getRecords()) {
            spec.setType(dictService.getDesByTypeAndValue("维修类型", spec.getType()));
        }
        return jsonPage(page);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap map) {
        Integer modelId = 1;
        List<Ship> shipList = shipService.getListByCompanyId(getCurrentUser().getCompanyId());
        List<RepairModelItem> type1 = repairModelItemService.byModelIdAndCatagoryContainParams(modelId, "通用服务");
        List<RepairModelItem> type2 = repairModelItemService.byModelIdAndCatagoryContainParams(modelId, "坞修工程");
        List<RepairModelItem> type3 = repairModelItemService.byModelIdAndCatagoryContainParams(modelId, "船体工程");
        List<RepairModelItem> type4 = repairModelItemService.byModelIdAndCatagoryContainParams(modelId, "机械工程");
        List<RepairModelItem> type5 = repairModelItemService.byModelIdAndCatagoryContainParams(modelId, "电气工程");
        List<RepairModelItem> type6 = repairModelItemService.byModelIdAndCatagoryContainParams(modelId, "冷藏工程");
        List<RepairModelItem> type7 = repairModelItemService.byModelIdAndCatagoryContainParams(modelId, "特种设备");
        List<RepairModelItem> type8 = repairModelItemService.byModelIdAndCatagoryContainParams(modelId, "其他");
        map.put("typeList", dictService.getListByType("维修类型"));
        map.put("modelId", modelId);
        map.put("shipList", shipList);
        map.put("type1", type1);
        map.put("type2", type2);
        map.put("type3", type3);
        map.put("type4", type4);
        map.put("type5", type5);
        map.put("type6", type6);
        map.put("type7", type7);
        map.put("type8", type8);
        return "go/repairSpec/add";
    }

    @RequestMapping(value = "/getModelDetailList", method = RequestMethod.GET)
    @ResponseBody
    public List<RepairModelDetail> getModelDetailList() {
        List<RepairModelDetail> repairModelDetailList = repairModelDetailService.getListByCompanyId(getCurrentUser().getCompanyId());
        return repairModelDetailList;
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(RepairSpec repairSpec,
                          RepairSpecItemList specItems, Integer[] repairDetailId) {
        JSONObject jsonObject = new JSONObject();
        Company company = companyService.selectById(getCurrentUser().getCompanyId());
        repairSpec.setCompanyId(company.getId());
        repairSpec.setCreateDate(new Date());
        repairSpec.setCreateBy(getCurrentUser().getName());
        repairSpec.setDelFlag(Const.DEL_FLAG_NORMAL);
        if (repairSpecService.saveRepairSpec(repairSpec, specItems, repairDetailId)) {
            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String info(@RequestParam(required = false) Integer id, ModelMap map) {
        RepairSpec repairSpec = repairSpecService.selectById(id);
        repairSpec.setType(dictService.getDesByTypeAndValue("维修类型", repairSpec.getType()));
        Integer modelId = repairSpec.getModelId();
        List<RepairSpecItem> type1 = repairSpecItemService.bySpecIdAndCatagoryForInfo(id, "通用服务", modelId);
        List<RepairSpecDetail> type2 = repairSpecDetailService.getListBySpecIdAndCatagory(id, "坞修工程");
        List<RepairSpecDetail> type3 = repairSpecDetailService.getListBySpecIdAndCatagory(id, "船体工程");
        List<RepairSpecDetail> type4 = repairSpecDetailService.getListBySpecIdAndCatagory(id, "机械工程");
        List<RepairSpecDetail> type5 = repairSpecDetailService.getListBySpecIdAndCatagory(id, "电气工程");
        List<RepairSpecDetail> type6 = repairSpecDetailService.getListBySpecIdAndCatagory(id, "冷藏工程");
        List<RepairSpecDetail> type7 = repairSpecDetailService.getListBySpecIdAndCatagory(id, "特种设备");
        List<RepairSpecDetail> type8 = repairSpecDetailService.getListBySpecIdAndCatagory(id, "其他");
        map.put("repairSpec", repairSpec);
        map.put("typeList", dictService.getListByType("维修类型"));
        map.put("type1", type1);
        map.put("type2", type2);
        map.put("type3", type3);
        map.put("type4", type4);
        map.put("type5", type5);
        map.put("type6", type6);
        map.put("type7", type7);
        map.put("type8", type8);
        return "go/repairSpec/info";
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
        sendEnquiryEmail("1061147291@qq.com", "试发带附件的邮件", fileList);
        return jsonObject;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam(required = false) Integer id, ModelMap map) {
        RepairSpec repairSpec = repairSpecService.selectById(id);
        List<RepairSpecItem> type1 = repairSpecItemService.bySpecIdAndCatagoryWithParamsAndValue(id, "通用服务", repairSpec.getModelId());
        List<RepairSpecItem> type2 = repairSpecItemService.bySpecIdAndCatagoryWithParamsAndValue(id, "坞修工程", repairSpec.getModelId());
        List<RepairSpecItem> type3 = repairSpecItemService.bySpecIdAndCatagoryWithParamsAndValue(id, "船体工程", repairSpec.getModelId());
        List<RepairSpecItem> type4 = repairSpecItemService.bySpecIdAndCatagoryWithParamsAndValue(id, "机械工程", repairSpec.getModelId());
        List<RepairSpecItem> type5 = repairSpecItemService.bySpecIdAndCatagoryWithParamsAndValue(id, "电气工程", repairSpec.getModelId());
        List<RepairSpecItem> type6 = repairSpecItemService.bySpecIdAndCatagoryWithParamsAndValue(id, "冷藏工程", repairSpec.getModelId());
        List<RepairSpecItem> type7 = repairSpecItemService.bySpecIdAndCatagoryWithParamsAndValue(id, "特种设备", repairSpec.getModelId());
        List<RepairSpecItem> type8 = repairSpecItemService.bySpecIdAndCatagoryWithParamsAndValue(id, "其他", repairSpec.getModelId());
        map.put("repairSpec", repairSpec);
        map.put("typeList", dictService.getListByType("维修类型"));
        map.put("type1", type1);
        map.put("type2", type2);
        map.put("type3", type3);
        map.put("type4", type4);
        map.put("type5", type5);
        map.put("type6", type6);
        map.put("type7", type7);
        map.put("type8", type8);
        map.put("nextProNoList", repairSpecDetailService.getNextProNo(id));
        return "go/repairSpec/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject edit(RepairSpec repairSpec,
                           RepairSpecItemList specItems, Integer[] repairDetailId) {
        JSONObject jsonObject = new JSONObject();
        if (repairSpecService.updateRepairSpec(repairSpec, specItems, repairDetailId)) {
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

    //导出工程单excel
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
            sendSpecExcelEmail(toAddress, "111", exportSpecExcel(id));
            errInfo = "success";
        } else {
            errInfo = "email error";
        }
        jsonObject.put("result", errInfo);
        return jsonObject;
    }


    //发送询价邮件
    public void sendEnquiryEmail(String toAddress, String text, List<File> files) {
        Multipart multipart = new MimeMultipart();
        //实例化一个bodypart用于封装内容
        BodyPart bodyPart = new MimeBodyPart();
        try {
            bodyPart.setContent("<font color='red'>这个是带有附件的HTML内容</font>", "text/html;charset=utf8");
            multipart.addBodyPart(bodyPart);
            //每一个部分实例化一个bodypart，故每个附件也需要实例化一个bodypart
            for (File file : files) {
                bodyPart = new MimeBodyPart();
                //实例化DataSource(来自jaf)，参数为文件的地址
                DataSource dataSource = new FileDataSource(file.getAbsolutePath());
                //使用datasource实例化datahandler
                DataHandler dataHandler = new DataHandler(dataSource);
                bodyPart.setDataHandler(dataHandler);
                //设置附件标题，使用MimeUtility进行名字转码，否则接收到的是乱码
                try {
                    bodyPart.setFileName(javax.mail.internet.MimeUtility.encodeText(file.getName()));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                //添加bodypart到multipart
                multipart.addBodyPart(bodyPart);
            }

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        sendEmail(toAddress, text, "附件", multipart);
        for (File file : files) {
            file.delete();
        }
    }


    //发送SpecExcel
    public void sendSpecExcelEmail(String toAddress, String text, File excel) {
        Multipart multipart = new MimeMultipart();
        //实例化一个bodypart用于封装内容
        BodyPart bodyPart = new MimeBodyPart();
        try {
            bodyPart.setContent("<font color='red'>这个是带有附件的HTML内容</font>", "text/html;charset=utf8");
            multipart.addBodyPart(bodyPart);
            //每一个部分实例化一个bodypart，故每个附件也需要实例化一个bodypart
            bodyPart = new MimeBodyPart();
            //实例化DataSource(来自jaf)，参数为文件的地址
            DataSource dataSource = new FileDataSource(excel.getAbsolutePath());
            //使用datasource实例化datahandler
            DataHandler dataHandler = new DataHandler(dataSource);
            bodyPart.setDataHandler(dataHandler);
            //设置附件标题，使用MimeUtility进行名字转码，否则接收到的是乱码
            try {
                bodyPart.setFileName(javax.mail.internet.MimeUtility.encodeText(excel.getName()));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            //添加bodypart到multipart
            multipart.addBodyPart(bodyPart);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        sendEmail(toAddress, text, "附件", multipart);
        excel.delete();
    }


    //导出工程单excel
    public File exportSpecExcel(Integer specId) {
        RepairSpec spec = repairSpecService.selectById(specId);
        List<RepairSpecDetail> detailList = null;
        String excelName = spec.getName() != null ? spec.getName() : spec.getShipName() + "工程单概述";

        File modelExcel = new File("detailModel.xls");
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

        List<Dict> dictList = dictService.getListByType("维修工程大类");
        for (Dict dict : dictList) {
            int catagoryRowNum = 0;
            String catagory = dict.getDes();
            if (!"通用服务".equals(catagory)) {
                HSSFSheet sheet = wb.createSheet(catagory);
                sheet.setColumnWidth(1, 50 * 256);
                detailList = repairSpecDetailService.getListBySpecIdAndCatagory(specId, catagory);

                HSSFRow row = sheet.createRow((int) catagoryRowNum++);
                HSSFCell cell = row.createCell((short) 0);

                row.createCell((short) 0).setCellValue("详单号");
                row.createCell((short) 1).setCellValue("详单内容");
                row.createCell((short) 2).setCellValue("单位");
                row.createCell((short) 3).setCellValue("数量");

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
                    }
                    row = sheet.createRow((int) catagoryRowNum++);
                }
            } else {
                HSSFSheet sheet = wb.createSheet(catagory);
                sheet.setColumnWidth(1, 50 * 256);
                sheet.setColumnWidth(4, 100 * 256);
                List<RepairSpecItem> itemList = repairSpecItemService.bySpecIdAndCatagoryForInfo(specId, catagory, spec.getModelId());
                HSSFRow row = sheet.createRow((int) 0);
                row.createCell((short) 0).setCellValue("项目号");
                row.createCell((short) 1).setCellValue("维修内容");
                row.createCell((short) 2).setCellValue("单位");
                row.createCell((short) 3).setCellValue("数量");
                row.createCell((short) 4).setCellValue("备注");

                for (RepairSpecItem item : itemList) {
                    row = sheet.createRow(sheet.getLastRowNum() + 1);
                    row.createCell((short) 0).setCellValue(item.getCode());
                    row.createCell((short) 1).setCellValue(item.getContent());
                    row.createCell((short) 2).setCellValue(item.getUnit());
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

        //待完善单独的详单表
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
                detailSheet.getRow(13).getCell(1).setCellValue(detail.getFaciName());//设备名称
                detailSheet.getRow(14).getCell(1).setCellValue(detail.getFaciType());//设备型号
                detailSheet.getRow(15).getCell(1).setCellValue(detail.getFaciSrc());//设备来源 厂家/国家
                detailSheet.getRow(16).getCell(1).setCellValue(detail.getFaciNo());//设备序列号
                detailSheet.getRow(11).getCell(3).setCellValue(detail.getFaciParam());//设备相关参数
                detailSheet.getRow(23).getCell(1).setCellValue(detail.getRepairPositionDesc());//维修详细位置
                detailSheet.getRow(27).getCell(2).setCellValue(detail.getDamage());//损坏程度
                detailSheet.getRow(40).getCell(1).setCellValue(detail.getRepairTechDesc());//修理工艺描述

                //维修部位
                Dict dict2 = new Dict();
                dict2.setType("维修部位");
                List<Dict> dictList1 = dictService.selectList(new EntityWrapper<>(dict2));
                String[] posList = new String[0];
                if (detail.getRepairPosition() != null) {
                    posList = detail.getRepairPosition().split(",");
                }

                int posRow = 19;
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
                            detailSheet.getRow(posRow).getCell(posCol + 1).setCellValue("√");
                            break;
                        }
                    }
                    if (r == posList.length) {
                        detailSheet.getRow(posRow).getCell(posCol).setCellValue(iDes);
                    }
                    posCol += 2;
                    if ((i + 1) % 4 == 0) {
                        posRow++;
                        posCol = 0;
                    }
                }

                //修理工艺
                Dict dict3 = new Dict();
                dict3.setType("修理工艺");
                List<Dict> dictList2 = dictService.selectList(new EntityWrapper<>(dict3));
                String[] techList = new String[0];
                if (detail.getRepairTech() != null) {
                    techList = detail.getRepairTech().split(",");
                }
                int techRow = 35;
                int techCol = 0;
                for (int i = 0; i < dictList2.size(); i++) {
                    iValue = dictList2.get(i).getValue();
                    iDes = dictList2.get(i).getDes();
                    int r;
                    for (r = 0; r < techList.length; r++) {
                        rValue = techList[r];
                        if (iValue.equals(rValue)) {
                            detailSheet.getRow(techRow).getCell(techCol).setCellValue(iDes);
                            detailSheet.getRow(techRow).getCell(techCol + 1).setCellValue("√");
                            break;
                        }
                    }
                    if (r == techList.length) {
                        detailSheet.getRow(techRow).getCell(techCol).setCellValue(iDes);
                    }
                    techCol += 2;
                    if ((i + 1) % 4 == 0) {
                        techRow++;
                        techCol = 0;
                    }
                }

                RepairSpecDetailReq req = new RepairSpecDetailReq();
                req.setRepairSpecDetailId(detail.getId());
                List<RepairSpecDetailReq> reqList = repairSpecDetailReqService.selectList(new EntityWrapper<>(req));
                int startRow = 5;
                for (RepairSpecDetailReq r : reqList) {
                    HSSFRow reqRow = detailSheet.getRow(startRow++);
                    reqRow.getCell(9).setCellValue(r.getDes());//要求和描述/材料
                    reqRow.getCell(14).setCellValue(r.getUnit());//单位
                    reqRow.getCell(15).setCellValue(r.getCount());//数量
                }
            }
        }

        wb.removeSheetAt(0);

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