package com.ctoangels.go.admin.base.tag;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.ctoangels.go.common.util.BeanFactoryUtils;
import com.ctoangels.go.common.modules.sys.entity.Menu;
import com.ctoangels.go.common.modules.sys.service.MenuService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;

/**
 * @author tangqian
 * @version 1.0
 */
public class NavigaterTag extends TagSupport {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private static Logger logger = LoggerFactory.getLogger(NavigaterTag.class);

    private String path;

    @Override
    public int doStartTag() throws JspException {
        MenuService menuService = BeanFactoryUtils.getFactory().getBean(MenuService.class);
        List<Menu> menus = null;
        String title="主页";
        try {
            menus = menuService.getHierarchyByPath(path);
        } catch (Exception e1) {
            logger.error("navigater tag init exception", e1);
        }
        JspWriter writer = pageContext.getOut();
        try {
            Locale locale= LocaleContextHolder.getLocale();
            String language=locale.getDisplayLanguage();
            if(language.equals("英文")){
                title="HomePage";
            }
            writer.append("<div class='page-bar'><ul class='page-breadcrumb'>").append("	<li><a href='./'><i class='icon-home'></i> "+title+"</a></li>");
            if (menus != null && !menus.isEmpty()) {
                writer.append("	<li><i class='fa fa-circle'></i>").append(menus.get(0).getMenuName()).append("</li>");
                if (menus.size() == 2) {
                    writer.append("	<li><i class='fa fa-circle'></i><a href='").append(menus.get(1).getMenuUrl()).append("' data-target='navTab'>")
                            .append(menus.get(1).getMenuName()).append("</a></li>");
                }
            }
            writer.append("</ul></div>");
            writer.flush();
        } catch (IOException e) {
            throw new JspException(e.getMessage(), e);
        }
        return super.doStartTag();
    }

    public void setPath(String path) {
        this.path = path;
    }

}
