<%@ page language="java" import="java.util.*" pageEncoding="GBK"%> 
<%@ page import="com.jspsmart.upload.SmartUpload"%> 
 
<%  
    SmartUpload su=new SmartUpload();  
    su.initialize(pageContext);  
    su.setContentDisposition(null);//��ֹ��������ļ� ֻ������  
    su.downloadFile("C:/Users/22295/Desktop/java/WebContent/WebContent/webfile/dodonew_CDF.pdf");  
    //out.clear();  
    //out=pageContext.pushBody();  
 %>