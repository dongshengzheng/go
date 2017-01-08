package com.fish.idle.admin.modules.sys.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fish.idle.admin.controller.BaseController;
import com.fish.idle.service.modules.sys.entity.Dict;
import com.fish.idle.service.modules.sys.service.IDictService;
import com.fish.idle.service.util.Const;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;

/**
 * Created by szy on 21/11/2016.
 */
@Controller()
@RequestMapping(value = "/dict")
public class DictController extends BaseController {


    private static Logger logger = LoggerFactory.getLogger(DictController.class);

    @Autowired
    private IDictService dictService;

    @RequestMapping
    public String page() {
        return "sys/dict/dict_list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String keyword) {
        EntityWrapper<Dict> ew = getEntityWrapper();
        if (!StringUtils.isEmpty(keyword))
            ew.addFilter("type={0}", keyword);
        return jsonPage(dictService.selectPage(getPage(), ew));
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String toAdd() {
        return "sys/dict/dict_add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(Dict dict) {
        JSONObject jsonObject = new JSONObject();
        dict.setDelFlag(Const.DEL_FLAG_NORMAL);
        dictService.insert(dict);
        jsonObject.put("status", 1);
        return jsonObject;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String toEdit(@RequestParam Integer id, ModelMap map) {
        Dict dict = dictService.selectById(id);
        map.put("dict", dict);
        return "sys/dict/dict_edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject edit(Dict dict) {
        JSONObject jsonObject = new JSONObject();
        dictService.updateSelectiveById(dict);
        jsonObject.put("status", 1);
        return jsonObject;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public JSONObject delete(@RequestParam Integer id) {
        dictService.deleteById(id);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", 1);
        return jsonObject;
    }


    @RequestMapping(value = "/batchDelete")
    @ResponseBody
    public JSONObject batchDelete(String ids) {
        JSONObject jsonObject = new JSONObject();
        dictService.deleteBatchIds(Arrays.asList(ids.split(",")));
        jsonObject.put("status", 1);
        return jsonObject;

    }
}
