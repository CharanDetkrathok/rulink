package com.rulink.model;

public class DatabaseInfo {
    
//    public static final String URL = "jdbc:mysql://127.0.0.1:3306/rulink?zeroDateTimeBehavior=convertToNull&autoReconnect=true&characterEncoding=UTF-8&characterSetResults=UTF-8";
    public static final String URL = "jdbc:mysql://127.0.0.1:3306/rulink?zeroDateTimeBehavior=convertToNull&autoReconnect=true&characterEncoding=UTF-8&characterSetResults=UTF-8";
    public static final String  USER = "root";
    public static final String PASSWORD = "aabb1122";
    public static final String DRIVER = "com.mysql.jdbc.Driver";

//    public static final String URL = "jdbc:oracle:thin:@10.2.1.98:1521:RUBRAM";
//    public static final String USER = "SP000";
//    public static final String PASSWORD = "STU3W1N5";
//    public static final String DRIVER = "oracle.jdbc.driver.OracleDriver"; 
    
   /* public static final String URL = "jdbc:oracle:thin:@10.2.1.98:1521:RUBRAM";
    public static final String  USER = "perqa";
    public static final String PASSWORD = "ru6ass9q";
    public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";*/
    

    private DatabaseInfo() {
    }
}
