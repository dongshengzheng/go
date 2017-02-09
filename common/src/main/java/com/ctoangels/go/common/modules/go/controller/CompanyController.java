package com.ctoangels.go.common.modules.go.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.go.entity.Company;
import com.ctoangels.go.common.modules.go.entity.Company;
import com.ctoangels.go.common.modules.go.service.ICompanyService;
import com.ctoangels.go.common.modules.go.service.ICompanyService;
import com.ctoangels.go.common.modules.sys.controller.BaseController;
import com.ctoangels.go.common.modules.sys.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Company 控制层
 */
@Controller
@RequestMapping("company")
public class CompanyController extends BaseController {
    @Autowired
    private ICompanyService companyService;

    //查找当前的用户所在的公司
    @RequestMapping
    public String info(ModelMap modelMap) {
        int companyId = getCurrentUser().getCompanyId();
        EntityWrapper<Company> ew = getEntityWrapper();
        ew.addFilter("id={0}", companyId);
        Company company = companyService.selectOne(ew);
        modelMap.put("company", company);
        return "go/company/list";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(ModelMap map) {
        Integer companyId = getCurrentUser().getCompanyId();
        if (companyId != null) {
            Company company = companyService.selectById(companyId);
            map.put("company", company);
        }
        return "go/company/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editComplete(Company company) {
        JSONObject jsonObject = new JSONObject();
        if (companyService.insertOrUpdate(company)) {
            jsonObject.put("success", true);
        } else {
            jsonObject.put("success", false);
            jsonObject.put("msg", "编辑时出错,请稍后再试");
        }
        return jsonObject;
    }

}