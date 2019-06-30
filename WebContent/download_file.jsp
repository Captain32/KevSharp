<%@ page language="java" import="java.util.*" pageEncoding="GBK"%> 
<%@ page import="com.jspsmart.upload.SmartUpload"%> 
 
<%  
    SmartUpload su=new SmartUpload();  
    su.initialize(pageContext);  
    su.setContentDisposition(null);//禁止浏览器打开文件 只能下载  
    su.downloadFile("C:/Users/22295/Desktop/java/WebContent/WebContent/webfile/dodonew_CDF.pdf");  
    //out.clear();  
    //out=pageContext.pushBody();  
 %>