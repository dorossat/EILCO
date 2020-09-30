<%--
  Created by IntelliJ IDEA.
  User: Hamza HRAMCHI
  Date: 30/09/2020
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Display data here !</title>
</head>
<body>
    Bonjour <%= request.getParameter("name") %> <br>
    name :  <%=request.getAttribute("name") %>
    <br/>
    <%
        String name = (String)request.getAttribute("name");
        name = "M. " + name + " " +  request.getParameter("name");
    %>
    Hello <%= name %>
</body>
</html>
