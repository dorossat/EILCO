<%--
  Created by IntelliJ IDEA.
  User: Hamza HRAMCHI
  Date: 30/09/2020
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="beanHello" scope="request" class="h.hamza.model.HelloBean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
    24
</head>
<body>
Bonjour <jsp:getProperty name="beanHello" property="name"/>
</body>
</html>
