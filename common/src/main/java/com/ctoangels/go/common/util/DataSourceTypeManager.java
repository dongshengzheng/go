package com.ctoangels.go.common.util;

/**
 * Created by lenovo on 2017/4/17.
 */
public class DataSourceTypeManager {

    /*本地用GOLOCAL  服务器用GOOLINE*/
    private static final ThreadLocal<DataSources> dataSourceTypes = new ThreadLocal<DataSources>() {
        @Override
        protected DataSources initialValue() {
            return DataSources.GOLOCAL;
        }
    };

    public static DataSources get() {
        return dataSourceTypes.get();
    }

    public static void set(DataSources dataSourceType) {
        dataSourceTypes.set(dataSourceType);
    }

    public static void reset() {
        dataSourceTypes.set(DataSources.GOLOCAL);
    }


}
