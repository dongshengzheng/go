package com.fish.idle.service.exception;

/**
 * @Description:
 * @Date 2015年6月10日 下午8:35:24
 * @author Sun.Han
 * @version V1.0
 */
public class HttpRequestException extends Exception {


    private static final long serialVersionUID = -4379504089067180862L;

    public HttpRequestException() {
        super();
    }

    public HttpRequestException(String message) {
        super(message);
    }

    public HttpRequestException(String message, Throwable cause) {
        super(message, cause);
    }

    public HttpRequestException(Throwable cause) {
        super(cause);
    }
}
