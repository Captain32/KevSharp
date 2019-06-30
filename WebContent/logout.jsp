<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%
session.removeAttribute("user_id");
out.println("<script>alert('您已成功注销登录！');this.location.href='index.jsp';</script>");
%>