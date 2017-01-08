package com.fish.idle.service.util;

import org.springframework.context.ApplicationContext;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName Const.java
 * @Description:
 * @Date Apr 19, 2015
 */
public class Const {

    public static final String COMMA = ",";

    public static final String SESSION_ROLES_NAME = "SESSION_ROLES_NAME";
    public static final String SESSION_ALL_RIGHTS_URL = "SESSION_ALL_RIGHTS_URL";


    public static final String SESSION_SECURITY_CODE = "sessionSecCode";
    public static final String SESSION_USER = "sessionUser";
    public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";

    public static final String SESSION_menuList = "menuList";            //当前菜单
    public static final String SESSION_ALLMENULIST = "allMenuList";        //全部菜单
    public static final String SESSION_ALLBUTTONLIST = "allButtonList"; //全部按钮
    public static final String SESSION_ALLUSERURL = "allUserUrl"; //全部按钮

    public static final String SESSION_userpds = "userpds";

    public static final String SESSION_USERROL = "USERROL";                //用户对象
    public static final String SESSION_USERNAME = "loginName";            //用户名

    public static final String TRUE = "T";
    public static final String FALSE = "F";
    public static final String LOGIN = "/login_toLogin.do";                //登录地址

    public static final String SYSNAME = "admin/config/SYSNAME.txt";    //系统名称路径
    public static final String PAGE = "admin/config/PAGE.txt";        //分页条数配置路径
    public static final String EMAIL = "admin/config/EMAIL.txt";        //邮箱服务器配置路径 TODO: email配置

    public static final String FILEPATHIMG = "uploadFiles/uploadImgs/";    //图片上传路径
    public static final String FILEPATHFILE = "uploadFiles/file/";        //文件上传路径

    /**
     * datatable插件显示分页表格所需要的数据字段名称（已废弃）
     */
    public static final String DISPLAYSTART = "iDisplayStart";
    public static final String DISPLAYLENGTH = "iDisplayLength";
    public static final String SECHO = "sEcho";
    public static final String TOTALRECORDS = "iTotalRecords";
    public static final String TOTALDISPLAYRECORDS = "iTotalDisplayRecords";
    public static final String DATA = "aaData";

    /**
     * 原生的datatable插件显示分页表格所需要的数据字段名称（推荐使用）
     */
    public static final String START = "start";
    public static final String LENGTH = "length";
    public static final String DRAW = "draw";
    public static final String RECORDSTOTAL = "recordsTotal";
    public static final String RECORDSFILTERED = "recordsFiltered";
    public static final String NDATA = "data";


    public static ApplicationContext WEB_APP_CONTEXT = null; //该值会在web容器启动时由WebAppContextListener初始化


    public static final String ADMIN_ROLE = "1";

    public static final String BUSINESS_ROLE = "2";

    public static final String CHANNEL_ROLE = "3";


    public static final int DEL_FLAG_NORMAL = 0; //正常
    public static final int DEL_FLAG_DELETE = 1; // 删除

    /**
     * 作品状态
     */
    public static final String WORKS_STATUS_DRAFT = "0";    // 草稿
    public static final String WORKS_STATUS_COMMIT = "1";    // 审核中
    public static final String WORKS_STATUS_UNPASS = "2";    // 未通过
    public static final String WORKS_STATUS_PASS = "3";      // 已通过

    public static final String WORKS_STATUS_TRANSFER = "10";      // 已通过 在转让中

    /**
     * 转让状态
     */
    public static final int TRANSFER_STATUS_HAVE = 1;    // 已转出、转入
    public static final int TRANSFER_STATUS_WAIT = 2;    // 待确认

    /**
     * 转让类型
     */
    public static final int TRANSFER_TYPE_SELL = 1;    // 售卖
    public static final int TRANSFER_TYPE_GIVE = 2;    // 赠送

    /**
     * 图片表中图片类型
     */
    public static final String IMAGES_WORKS = "0";    // 作品普通图片
    public static final String IMAGES_REPORT_CERTIFICATE = "1";    // 作品认证图片
    public static final String IMAGES_REPORT_DES = "2";    // 评估报告
    public static final String IMAGES_INTERPRETATION = "3";    // 作品诠释图片


    //consumer类型
    public static final String CONSUMER_TYPE_PROVIDER = "1";  //提供者
    public static final String CONSUMER_TYPE_COLLECT = "2";  //收藏者

    public static final String CONSUMER_PUB_YES = "1";    // 公开
    public static final String CONSUMER_PUB_NO = "２";    // 不公开

    //follow history类型
    public static final int FOLLOW_HISTORY_TYPE_COLLECT = 0;   // 收藏作品
    public static final int FOLLOW_HISTORY_TYPE_FOCUS = 1;   // 关注用户
    public static final int FOLLOW_HISTORY_TYPE_BROWSE = 2;   // 浏览作品


    public static final String SITE_SESSION_USER = "siteSessionUser";


}
