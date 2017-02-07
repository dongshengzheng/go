package com.ctoangels.go.common.modules.go.controller;

import com.ctoangels.go.common.modules.go.service.ICompanyService;
import com.ctoangels.go.common.modules.go.service.IShipService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Company 控制层
 *
 */
@Controller
@RequestMapping("owner")
public class CompanyController extends BaseController {
    @Autowired
    private ICompanyService companyService;

    @RequestMapping
    public String info() {
        return "go/company/info";
    }
}