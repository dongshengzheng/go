package com.ctoangels.go.common.modules.go.service;

import com.ctoangels.go.common.modules.go.entity.Enquiry;
import com.baomidou.framework.service.ISuperService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * Enquiry 表数据服务层接口
 *
 */
public interface IEnquiryService extends ISuperService<Enquiry> {
    Enquiry readExcel(MultipartFile file, Integer shipyardId, Integer repairSpecId) throws Exception;
}