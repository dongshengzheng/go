package com.ctoangels.go.common.util;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;

/**
 * 获取计算机的唯一的一个mac地址编码
 * Created by zhen_Tomcat on 2017/04/25.
 */
public class MacAddress {

    public static String transBytesToStr(){
        byte[] bytes=null;

        try {
            InetAddress adress = InetAddress.getLocalHost();
            NetworkInterface net = NetworkInterface.getByInetAddress(adress);
            bytes = net.getHardwareAddress();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (SocketException e) {
            e.printStackTrace();
        }



        StringBuffer buffer = new StringBuffer();
        for(int i = 0; i < bytes.length; i++){
            if(i != 0)
                buffer.append("-");
            //bytes[i]&0xff将有符号byte数值转换为32位有符号整数，其中高24位为0，低8位为byte[i]
            int intMac = bytes[i]&0xff;
            //toHexString函数将整数类型转换为无符号16进制数字
            String str = Integer.toHexString(intMac);
            if(str.length() == 0){
                buffer.append("0");
            }
            buffer.append(str);
        }
        return buffer.toString().toUpperCase();
    }
}
