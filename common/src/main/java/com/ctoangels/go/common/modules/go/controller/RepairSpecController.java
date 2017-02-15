package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.Company;
import com.ctoangels.go.common.modules.go.entity.RepairModelItem;
import com.ctoangels.go.common.modules.go.entity.RepairSpec;
import com.ctoangels.go.common.modules.go.service.ICompanyService;
import com.ctoangels.go.common.modules.go.service.IRepairModelItemService;
import com.ctoangels.go.common.modules.go.service.IRepairSpecService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.util.Const;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * RepairSpec 控制层
 */
@Controller
@RequestMapping("repairSpec")
public class RepairSpecController extends BaseController {
    @Autowired
    private IRepairSpecService repairSpecService;

    @Autowired
    private IRepairModelItemService repairModelItemService;

    @Autowired
    private ICompanyService companyService;

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
            ew.like("shipName", keyword);
        ew.addFilter("company_id={0}", companyId);
        Page<RepairSpec> page = repairSpecService.selectPage(getPage(), ew);
        return jsonPage(page);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap map) {
        List<RepairModelItem> type1 = repairModelItemService.byModelIdAndCatagoryContainParams(1, "船体工程");
       map.put("type1", type1);
        return "go/repairSpec/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(RepairSpec repairSpec) {
        JSONObject jsonObject = new JSONObject();
        Company company = companyService.selectById(getCurrentUser().getCompanyId());
        repairSpec.setCompanyId(company.getId());
        repairSpec.setDelFlag(Const.DEL_FLAG_NORMAL);
        if (repairSpecService.insert(repairSpec)) {
            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "添加时出错,请稍后再试");
        }
        return jsonObject;
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
        map.put("repairSpec", repairSpec);
        return "go/repairSpec/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editComplete(RepairSpec repairSpec) {
        JSONObject jsonObject = new JSONObject();
        if (repairSpecService.updateById(repairSpec)) {
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



}