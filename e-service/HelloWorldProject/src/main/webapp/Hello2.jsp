<%--
  Created by IntelliJ IDEA.
  User: Hamza HRAMCHI
  Date: 30/09/2020
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Avec EL</title>
</head>
<body>
<br/>
<c:forEach var="aBean" items="${beanHello}">
    Test ${aBean.name}
</c:forEach>
</body>
</html>
