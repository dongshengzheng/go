package com.fish.idle.service.util;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.ConfigGenerator;

public class CustomGenerator {
    public static void main(String[] args) {
        ConfigGenerator cg = new ConfigGenerator();
        // 配置 MySQL 连接
        cg.setDbDriverName("com.mysql.jdbc.Driver");
        cg.setDbUser("root");
        cg.setDbPassword("root");
        cg.setDbUrl("jdbc:mysql://127.0.0.1:3306/jsdd?characterEncoding=utf8");
        // 配置包名
        cg.setEntityPackage("com.fish.idle.service.modules.sys.entity");
        cg.setMapperPackage("com.fish.idle.service.modules.sys.mapper");
        cg.setServicePackage("com.fish.idle.service.modules.sys.service");
        cg.setXmlPackage("com.fish.idle.service.modules.sys.mapper.xml");
        cg.setServiceImplPackage("com.fish.idle.service.modules.sys.service.impl");
        cg.setControllerPackage("com.fish.idle.service.modules.sys.controller");

        String[] tables= {"sys_app_user",
        };
        cg.setTableNames(tables);
        cg.setDbPrefix(true);


        // 配置表主键策略
        cg.setIdType(IdType.AUTO);

        // 配置保存路径
        cg.setSaveDir("/Users/sunhan/Workspace/project/jsdd/service/src/main/java");
        // 其他参数请根据上面的参数说明自行配置，当所有配置完善后，运行AutoGenerator.run()方法生成Code
        // 生成代码
        AutoGenerator.run(cg);
    }
}
