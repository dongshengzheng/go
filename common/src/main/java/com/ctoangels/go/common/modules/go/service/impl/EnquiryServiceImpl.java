package com.ctoangels.go.common.modules.go.service.impl;

import com.ctoangels.go.common.modules.go.entity.EnquiryReq;
import com.ctoangels.go.common.modules.go.entity.PrivateShipyard;
import com.ctoangels.go.common.modules.go.mapper.EnquiryReqMapper;
import com.ctoangels.go.common.modules.go.mapper.PrivateShipyardMapper;
import com.ctoangels.go.common.util.Const;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctoangels.go.common.modules.go.mapper.EnquiryMapper;
import com.ctoangels.go.common.modules.go.entity.Enquiry;
import com.ctoangels.go.common.modules.go.service.IEnquiryService;
import com.baomidou.framework.service.impl.SuperServiceImpl;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * Enquiry 表数据服务层接口实现类
 *
 */
@Service
public class EnquiryServiceImpl extends SuperServiceImpl<EnquiryMapper, Enquiry> implements IEnquiryService {

    @Autowired
    private EnquiryReqMapper enquiryReqMapper;

    @Autowired
    private PrivateShipyardMapper privateShipyardMapper;

    @Autowired
    private EnquiryMapper enquiryMapper;

    @Override
    public Enquiry readExcel(MultipartFile file, Integer shipyardId, Integer repairSpecId)throws Exception {

        Workbook wb=new HSSFWorkbook(file.getInputStream());

        //判读数据库是否含有改船厂的询价
        Enquiry enquiry1=enquiryMapper.selectByShipyardIdAndRepairSpecId(shipyardId,repairSpecId);

        if(enquiry1!=null){
            enquiry1.setDelFlag(Const.DEL_FLAG_DELETE);
            enquiryMapper.updateById(enquiry1);
        }


        String a[] = new String[]{"通用服务", "坞修工程", "船体工程", "机械工程", "电气工程", "冷藏工程", "特种设备", "其他"};
        List<EnquiryReq> reqs = new ArrayList<>();
        for (int i = 0; i < a.length; i++) {
            Sheet sheet = wb.getSheet(a[i]);//获取sheet的对象
            if (sheet != null) {
                int rows = sheet.getLastRowNum();
                for (int j = 1; j <= rows; j++) {
                    Row row = sheet.getRow(j);
                    if (row != null) {
                        EnquiryReq req = new EnquiryReq();
                        for (int n = 0; n <= 5; n++) {
                            Cell cell = row.getCell(n);
                           if (cell != null) {
                               if (n == 0) {
                                   req.setCode(row.getCell(0).getStringCellValue());
                                } else if (n == 1) {
                                    req.setContent(row.getCell(1).getStringCellValue());
                                } else if (n == 2) {
                                   row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
                                    req.setUnit(row.getCell(2).getStringCellValue());
                                } else if (n == 3) {
                                    row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
                                    req.setCount((row.getCell(3).getStringCellValue()));
                                } else if (n == 4) {
                                    row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
                                    req.setTariff(row.getCell(4).getStringCellValue());
                                } else if (n == 5) {
                                    row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
                                    req.setTotal(row.getCell(5).getStringCellValue());
                                } else {
                                    req.setRemark(row.getCell(6).getStringCellValue());
                                }
                            }
                        }
                        req.setCategory(sheet.getSheetName());
                        reqs.add(req);
                    }
                }
            }
        }
        float totalPrice=0;
        for(EnquiryReq r:reqs){
            if(r.getTotal()!=null && !r.getTotal().equals("")){
                totalPrice+= Float.parseFloat(r.getTotal());
            }
        }
        Enquiry enquiry=new Enquiry();
        enquiry.setQuoteTotlePrice(String.valueOf(totalPrice));
        enquiry.setRepairSpecId(repairSpecId);
        enquiry.setPrivateShipyardId(shipyardId);
        enquiry.setPrivateShipyardName(privateShipyardMapper.selectById(shipyardId).getName());
        enquiry.setFileName(file.getOriginalFilename());
        enquiry.setDelFlag(Const.DEL_FLAG_NORMAL);

        enquiryMapper.insert(enquiry);

        for(EnquiryReq r:reqs){
            r.setEnquiryId(enquiry.getId());
        }
        enquiryReqMapper.insertBatch(reqs);

        return enquiry;
    }
}