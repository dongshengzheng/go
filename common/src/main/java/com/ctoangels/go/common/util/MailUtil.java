package com.ctoangels.go.common.util;

import com.ctoangels.go.common.modules.go.entity.MemoMedia;
import com.ctoangels.go.common.modules.go.entity.Report;
import com.ctoangels.go.common.modules.go.entity.ReportDetail;
import com.ctoangels.go.common.modules.sys.entity.MailAuthenticator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.Security;
import java.util.*;

/**
 * Created by lenovo on 2017/3/20.
 */
public class MailUtil {

    private static String sitePath;

    private static String fromAddress;

    private static String fromPassword;

    private static String mailSmtpHost;

    private static String mailSmtpPort;

    private static String effectiveTime;

    static {
        Properties prop = new Properties();
        InputStream in = MailUtil.class.getResourceAsStream("/override.properties");
        try {
            prop.load(in);
            sitePath = prop.getProperty("site_path");
            fromAddress = prop.getProperty("fromAddress");
            fromPassword = prop.getProperty("fromPassword");
            mailSmtpHost = prop.getProperty("mail.smtp.host");
            mailSmtpPort = prop.getProperty("mail.smtp.port");
            effectiveTime = prop.getProperty("effectiveTime");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //发送邮件 1.收件人 2.信息 3.标题 4.附件
    public static void sendEmail(String toAddress, String text, String subject, Multipart multipart) {
        Properties props = new Properties();
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        props.put("mail.smtp.host", mailSmtpHost); //smtp服务器地址
        props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.put("mail.smtp.socketFactory.fallback", "false");
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
                message.setContent(text, "text/html;charset=utf-8"); //设置文本内容 单一文本使用setText,Multipart复杂对象使用setContent
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

    //发送邮件 1.收件人 2.信息 3.标题 4.附件
    public static void sendEmail(String[] toAddress, String text, String subject, Multipart multipart) {
        Properties props = new Properties();
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        props.put("mail.smtp.host", mailSmtpHost); //smtp服务器地址
        props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.put("mail.smtp.socketFactory.fallback", "false");
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
                message.setContent(text, "text/html;charset=utf-8"); //设置文本内容 单一文本使用setText,Multipart复杂对象使用setContent
            }
            if (multipart != null) {
                message.setContent(multipart);
            }
            message.setSubject(subject); //设置标题
            InternetAddress[] addresses = new InternetAddress[toAddress.length];
            for (int i = 0; i < toAddress.length; i++) {
                addresses[i] = new InternetAddress(toAddress[i]);
            }
            message.addRecipients(Message.RecipientType.TO, addresses);
            Transport.send(message); //使用Transport静态方法发送邮件
        } catch (AddressException e) {
            //此处处理AddressException异常  [The exception thrown when a wrongly formatted address is encountered.]
        } catch (MessagingException e) {
            //此处处理MessagingException异常 [The base class for all exceptions thrown by the Messaging classes ]
        }
    }


    //发送注册时的验证邮件
    public static void sendActivateEmail(String toAddress, String validateCode) {
        StringBuffer sb = new StringBuffer();
        sb.append("<html>");
        sb.append("<head>");
        sb.append("<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>");
        sb.append("<title>Daily Report</title>");


        sb.append("<style>");
        sb.append(" a:hover img {  -webkit-transform: scale(1.5, 1.5);  -moz-transform: scale(1.5, 1.5);  -transform: scale(1.5, 1.5);  }");
        sb.append("</style>");

        sb.append("</head>");
        sb.append("<body>");
        sb.append("点击下面链接激活账号，" + effectiveTime + "分钟生效，否则重新注册账号，链接只能使用一次，请尽快激活!");
        sb.append("<br>");
        String href = sitePath + "/register/activate?action=activate&email=" + toAddress + "&validateCode=" + validateCode;
//        sb.append(sitePath + "/register/activate?action=activate&email=");
//        sb.append(toAddress);
//        sb.append("&validateCode=");
//        sb.append(validateCode);
        sb.append("<a href='" + href + "'>" + "点击进行激活" + "</a>");

        sb.append("<br>=================================<br>");
        String imgPath = "https://zhstatic.zhihu.com/eDM/roundtable/chunjiyundong.jpg";

        sb.append("<a href='" + imgPath + "'>");
        sb.append("<img id='img1' src='" + imgPath + "' />");
        sb.append("</a>");

        sb.append("</body>");
        sb.append("</html>");

        MailUtil.sendEmail(toAddress, sb.toString(), "欢迎注册", null);
    }

    //发送更改邮箱时的验证邮件
    public static void sendChangeEmailCode(String toAddress, HttpSession session) {
        StringBuffer sb = new StringBuffer();
        String base = "0123456789";
        Random random = new Random();
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 6; ++i) {
            int number = random.nextInt(base.length());
            code.append(base.charAt(number));
        }
        session.setAttribute("sessionChangeEmail", toAddress);
        session.setAttribute("sessionChangeEmailCode", code.toString());
        sb.append("请尽快使用下面的验证码进行验证");
        sb.append(code.toString());
        MailUtil.sendEmail(toAddress, sb.toString(), "更换邮箱", null);
    }


    //发送询价邮件
    public static void sendEnquiryEmail(String toAddress, String text, List<File> files) {
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
        MailUtil.sendEmail(toAddress, text, "附件", multipart);
        for (File file : files) {
            file.delete();
        }
    }

    //发送SpecExcel
    public static void sendSpecExcelEmail(String toAddress, String text, File excel) {
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
        MailUtil.sendEmail(toAddress, text, "附件", multipart);
        excel.delete();
    }


    //发送每日报告邮件
    public static void sendReportEmail(Report report, List<ReportDetail> reportDetailList, String[] toAddress) {
        StringBuffer sb = new StringBuffer();
        sb.append("<html>");
        sb.append("<head>");
        sb.append("<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>");
        sb.append("<title>Daily Report</title>");
        sb.append("<style>.img-div{float:left;width:48%;margin-right:0.5%}   img{max-width:100%;max-height:100%;}</style>");
//        sb.append("<link href='http://windyeel.oss-cn-shanghai.aliyuncs.com/global/plugins/bootstrap/css/bootstrap.min.css' rel='stylesheet' type='text/css' />");
        sb.append("</head>");
        sb.append("<body>");
        sb.append("<table width='100%' cellpadding='0' cellspacing='0' bgcolor='ffffff'>");
        sb.append("<tr>");
        sb.append("<td>");
        sb.append(
                "<table id='top-message' style='border-top: solid 1px rgba(5, 5, 5, 0.2);border-left: solid 1px rgba(5, 5, 5, 0.2);border-right: solid 1px rgba(5, 5, 5, 0.2);' bgcolor='e4e4e4' cellpadding='10' cellspacing='0' width='600' align='center'>");
        sb.append("<tbody>");
        sb.append("<tr>");
        sb.append("<td align='center' height='40px;'><span style='font-size: 24px;'><b>Daily Report</b></span></td>");
        sb.append("</tr>");
        sb.append("<tr>");
        sb.append("<td align='right'><span style='font-size: 18px;'>");
        // 设置发送时间
        sb.append(DateUtil.formatDate(new Date(), "yyyy-MM-dd"));
        sb.append("</span></td>");
        sb.append("</tr>");
        sb.append("</tbody>");
        sb.append("</table>");
        sb.append(
                "<table id='main' style='border-bottom: solid 1px rgba(5, 5, 5, 0.2);border-left: solid 1px rgba(5, 5, 5, 0.2);border-right: solid 1px rgba(5, 5, 5, 0.2);' bgcolor='e4e4e4' cellpadding='10' cellspacing='0' width='600' align='center'>");
        sb.append("<tr>");
        sb.append("<td>");
        sb.append("<table style='width: 100%;border-spacing: 0;' bgcolor='#ffffff' >");
        sb.append("<tbody>");
        sb.append("<tr style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
        sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'><b>SHIP NAME</b>");
        sb.append(" </td>");
        sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
        // 设置船名
        sb.append("我是船名");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
        sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'><b>Weather</b></td>");
        sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
        // 设置天气
        sb.append(report.getWeather());
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
        sb.append(" <td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
        sb.append("<b>Temperature(°C)</b>");
        sb.append(" </td>");
        sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
        // 设置温度
        sb.append(report.getTemperature());
        sb.append("</td>");

        sb.append("</tr>");
        sb.append("<tr style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
        sb.append(" <td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'><b>Humidity(%)</b>");
        sb.append("</td>");
        sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
        // 设置湿度
        sb.append(report.getHumidity());
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("</tbody>");
        sb.append("</table>");
        sb.append("</td>");
        sb.append("</tr>");

        // 设置MEMO
        sb.append("<tr>");
        sb.append("<td>");
        sb.append("<div style=' background-color: #FFFFFF;margin-top: 5px;'>");
        sb.append("<div style='padding: 3px;'>");
        sb.append(" <span style='height: 2em ;line-height: 2em'><b>Remark</b></span>");
        sb.append(" </div>");
        sb.append("<div style='border-top: solid 1px rgba(5, 5, 5, 0.2);padding: 3px;'>");
        sb.append(
                "<p>" + DateUtil.formatDate(new Date(), "yyyy-MM-dd HH:mm") + "</p>");
        String remark = report.getRemark();
        if (remark == null || remark.equals("")) {
            remark = "NONE";
        }
        sb.append("<p>" + remark + "</p>");
        sb.append("</div>");

        sb.append("</div>");
        sb.append("</td>");
        sb.append("</tr>");

        // 设置明日计划
        sb.append("<tr>");
        sb.append("<td>");
        sb.append("<div style=' background-color: #FFFFFF;margin-top: 5px;'>");
        sb.append("<div style='padding: 3px;'>");
        sb.append(" <span style='height: 2em ;line-height: 2em'><b>Tomorrow Plan</b></span>");
        sb.append(" </div>");
        sb.append("<div style='border-top: solid 1px rgba(5, 5, 5, 0.2);padding: 3px;'>");
        String tomorrowPlan = report.getTomorrowPlan();
        if (tomorrowPlan == null || tomorrowPlan.equals("")) {
            tomorrowPlan = "NONE";
        }
        sb.append("<p>" + tomorrowPlan + "</p>");
        sb.append("</div>");

        sb.append("</div>");
        sb.append("</td>");
        sb.append("</tr>");

        // 设置当日工作
        sb.append("<tr>");
        sb.append("<td>");
        sb.append("<div style=' background-color: #FFFFFF;margin-top: 5px;'>");
        sb.append("<div style='padding: 3px;'>");
        sb.append(" <span style='height: 2em ;line-height: 2em'><b>The major job scope of the crew on duty</b></span>");
        sb.append(" </div>");
        sb.append("<div style='border-top: solid 1px rgba(5, 5, 5, 0.2);padding: 3px;'>");
        String crewJob = report.getCrewJob();
        if (crewJob == null || crewJob.equals("")) {
            crewJob = "NONE";
        }
        sb.append("<p>" + crewJob + "</p>");
        sb.append("</div>");

        sb.append("</div>");
        sb.append("</td>");
        sb.append("</tr>");

        // 设置检查员状态
        sb.append("<tr>");
        sb.append("<td>");
        sb.append("<div style=' background-color: #FFFFFF;margin-top: 5px;'>");

        sb.append("<div style='padding: 3px;'>");
        sb.append(" <span style='height: 2em ;line-height: 2em'><b>The status with the inspector/surveyor</b></span>");
        sb.append(" </div>");
        sb.append("<div style='border-top: solid 1px rgba(5, 5, 5, 0.2);padding: 3px;'>");
        String shipInspection = report.getShipInspection();
        if (shipInspection == null || shipInspection.equals("")) {
            shipInspection = "NONE";
        }
        sb.append("<p>" + shipInspection + "</p>");
        sb.append("</div>");
        sb.append("</div>");
        sb.append("</td>");
        sb.append("</tr>");


        //设置报告详单
        if (reportDetailList != null && reportDetailList.size() > 0) {
            for (ReportDetail r : reportDetailList) {
                sb.append("<tr>");
                sb.append("<td>");
                sb.append("<table style='width: 100%;border-spacing: 0;margin-top: 5px;' bgcolor='#ffffff' > ");
                sb.append("<thead>");
                sb.append("<tr style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                sb.append("<th style='width: 25%'>S/N</th>");
                sb.append("<th style='width: 75%'>ITEM DESCRIPTION</th>");
                sb.append("</tr>");
                sb.append("</thead>");
                sb.append("<tbody>");

                sb.append("<tr style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>"
                        + r.getRepairProgDetail().getProOrderNo() + "</td>");
                sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                sb.append(r.getRepairProgDetail().getProName());
                sb.append("</td>");
                sb.append("</tr>");
                sb.append("<tr style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>STATUS</td>");
                sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                String[] taskStatus = {"已完成", "进行中", "未开始", "已取消"};
                sb.append(taskStatus[r.getTaskStatus()]);
                sb.append("</td>");
                sb.append("</tr>");

                sb.append("<tr style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>详情记录</td>");
                sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                sb.append(r.getMemo());
                sb.append("</td>");
                sb.append("</tr>");

                sb.append("<tr style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>工程照片</td>");
                sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                for (MemoMedia mm : r.getImgList()) {
                    sb.append("<div class='img-div'><a target='_blank' href='" + mm.getOss() + "' ><img src='" + mm.getOss() + "'></a></div>");
                }
                sb.append("</td>");
                sb.append("</tr>");

                sb.append("<tr style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>相关文件</td>");
                sb.append("<td style='border: solid 1px rgba(5, 5, 5, 0.2);padding: 3px 3px 3px 3px;'>");
                for (MemoMedia mm : r.getMp3List()) {
                    sb.append("<a download='' href='" + mm.getOss() + "'>" + mm.getFilename() + "</a> &nbsp; ");
                }
                for (MemoMedia mm : r.getOtherList()) {
                    sb.append("<a download='' href='" + mm.getOss() + "'>" + mm.getFilename() + "</a> &nbsp; ");
                }
                sb.append("</td>");
                sb.append("</tr>");

                sb.append("</tbody>");
                sb.append("</table>");
                sb.append("</td>");
                sb.append("</tr>");
            }
        }

        sb.append("</table>");
        sb.append("</td>");
        sb.append("</tr>");

        sb.append("</table>");

        sb.append(
                "<table id='footer-message' style='padding-top:20px;' bgcolor='ffffff' cellpadding='0' cellspacing='0' width='600' align='center'>");
        sb.append("<tbody>");
        sb.append("<tr>");
        sb.append("<td >GOSHIPYARD:<a href='http://www.goshipyard.com'>www.goshipyard.com</a></td>");
        sb.append("</tr>");
        sb.append("</tbody>");
        sb.append("</table>");
        sb.append("</body>");
        sb.append("</html>");
        sendEmail(toAddress, sb.toString(), "每日报告", null);
    }
}
