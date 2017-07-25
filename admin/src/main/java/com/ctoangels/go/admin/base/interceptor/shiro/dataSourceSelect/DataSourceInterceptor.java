package com.ctoangels.go.admin.base.interceptor.shiro.dataSourceSelect;

import com.ctoangels.go.common.util.DataSourceTypeManager;
import com.ctoangels.go.common.util.DataSources;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by lenovo on 2017/4/17.
 */
public class DataSourceInterceptor {

    private static Logger logger = LoggerFactory.getLogger(DataSourceInterceptor.class);

    public DataSourceInterceptor() {
        logger.info("DataSourceInterceptor被启动了");
    }

    public void doBefore() {
        DataSourceTypeManager.set(DataSources.GOONLINE);
    }

    public void doAfter() {
        DataSourceTypeManager.set(DataSources.GOLOCAL);
    }

    //服务器
//    public void doBefore() {
//        DataSourceTypeManager.set(DataSources.GOLOCAL);
//    }
//
//    public void doAfter() {
//        DataSourceTypeManager.set(DataSources.GOONLINE);
//    }
}