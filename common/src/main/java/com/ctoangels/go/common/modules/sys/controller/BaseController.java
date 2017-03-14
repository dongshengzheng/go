package com.ctoangels.go.common.modules.sys.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ctoangels.go.common.modules.sys.entity.MailAuthenticator;
import com.ctoangels.go.common.modules.sys.entity.User;
import com.ctoangels.go.common.util.Const;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.Security;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName BaseController.java
 * @Description: Controller基类
 * @Date Apr 17, 2015
 */
public class BaseController {


    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpSession session;

    @Value("${site_path}")
    private String sitePath;

    @Value("${fromAddress}")
    private String fromAddress;

    @Value("${fromPassword}")
    private String fromPassword;

    @Value("${mail.smtp.host}")
    private String mailSmtpHost;

    @Value("${mail.smtp.port}")
    private String mailSmtpPort;

    @Value("${effectiveTime}")
    private String effectiveTime;

    @Autowired
    protected ServletContext application;

    public HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    /**
     * @param binder
     * @Title: initBinder
     * @Description:日期格式转换
     * @date Apr 17, 2015
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
    }


    public User getCurrentUser() {
        Subject subject = SecurityUtils.getSubject();
        return (User) subject.getPrincipal();
    }

    /**
     * <p>
     * 转换为 bootstrap-table 需要的分页格式 JSON
     * </p>
     *
     * @param page 分页对象
     * @return
     */
    protected JSONObject jsonPage(Page<?> page) {
        JSONObject jo = new JSONObject();
        jo.put(Const.DRAW, request.getParameter(Const.DRAW));
        jo.put(Const.RECORDSTOTAL, page.getTotal());
        jo.put(Const.RECORDSFILTERED, page.getTotal());
        jo.put(Const.NDATA, page.getRecords());
        return jo;
    }

    /**
     * <p>
     * 获取分页对象
     * </p>
     *
     * @return
     */
    protected <T> Page<T> getPage() {
        int start = 0;
        int length = 10;
        if (request.getParameter(Const.LENGTH) != null) {
            start = Integer.parseInt(request.getParameter(Const.START));
        }
        if (request.getParameter(Const.LENGTH) != null) {
            length = Integer.parseInt(request.getParameter(Const.LENGTH));
        }
        return new Page<>(start / length + 1, length);
    }

    protected <T> EntityWrapper<T> getEntityWrapper() {
        EntityWrapper<T> ew = new EntityWrapper<>();
        ew.where("del_flag={0}", Const.DEL_FLAG_NORMAL);
        return ew;
    }

    /**
     * 返回 JSON 格式对象
     *
     * @param object 转换对象
     * @return
     */
    protected String toJson(Object object) {
        return JSON.toJSONString(object, SerializerFeature.BrowserCompatible);
    }


    /**
     * 返回 JSON 格式对象
     *
     * @param object 转换对象
     * @param format 序列化特点
     * @return
     */
    protected String toJson(Object object, String format) {
        if (format == null) {
            return toJson(object);
        }
        return JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat);
    }


    //发送邮件 1.收件人 2.信息 3.标题
    public void sendEmail(String toAddress, String text, String subject, Multipart multipart) {
        Properties props = new Properties();
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        props.put("mail.smtp.host", mailSmtpHost); //smtp服务器地址
        props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.put("mail.smtp.port", mailSmtpPort);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.auth", true);  //是否需要认证

        MailAuthenticator myauth = new MailAuthenticator(fromAddress, fromPassword);
        //获得一个带有authenticator的session实例
        javax.mail.Session session = javax.mail.Session.getInstance(props, myauth);
        session.setDebug(true);//打开debug模式，会打印发送细节到console
        Message message = new MimeMessage(session); //实例化一个MimeMessage集成自abstract Message 。参数为session
        try {
            message.setFrom(new InternetAddress(fromAddress)); //设置发出方,使用setXXX设置单用户，使用addXXX添加InternetAddress[]

            if (text != null) {
                message.setText(text); //设置文本内容 单一文本使用setText,Multipart复杂对象使用setContent
            }

            if (multipart != null) {
                message.setContent(multipart);
            }

            message.setSubject(subject); //设置标题

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddress)); //设置接收方

            Transport.send(message); //使用Transport静态方法发送邮件

        } catch (AddressException e) {
            //此处处理AddressException异常  [The exception thrown when a wrongly formatted address is encountered.]

        } catch (MessagingException e) {
            //此处处理MessagingException异常 [The base class for all exceptions thrown by the Messaging classes ]
        }
    }


}
