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
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    @RequestMapping(value = "/exportExcel", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject exportRepairSpecExcel(Integer id) {
        JSONObject jsonObject = new JSONObject();
        sendSpecExcelEmail("1061147291@qq.com", "111", exportSpecExcel(id));
        jsonObject.put("status", 1);
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
        String excelName = spec.getName() != null ? spec.getName() : spec.getShipName() + "工程单概述";

        HSSFWorkbook wb = new HSSFWorkbook();

        List<Dict> dictList = dictService.getListByType("维修工程大类");
        for (Dict dict : dictList) {
            int catagoryRowNum = 0;
            String catagory = dict.getDes();
            HSSFSheet sheet = wb.createSheet(catagory);
            sheet.setColumnWidth(1, 50 * 256);

            List<RepairSpecDetail> detailList = repairSpecDetailService.getListBySpecIdAndCatagory(specId, catagory);

            HSSFRow row = sheet.createRow((int) catagoryRowNum++);
            HSSFCell cell = row.createCell((short) 0);

            row.createCell((short) 0).setCellValue("详单号");
            row.createCell((short) 1).setCellValue("详单内容");
            row.createCell((short) 2).setCellValue("单位");
            row.createCell((short) 3).setCellValue("数量");

            HSSFCellStyle linkStyle = wb.createCellStyle();
            CellStyle cellStyle = wb.createCellStyle();
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


                HSSFSheet detailSheet = wb.createSheet(proOrderNo);
                //待完善单独的详单表
            }
        }

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