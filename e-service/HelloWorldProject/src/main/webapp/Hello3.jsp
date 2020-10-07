<%--
  Created by IntelliJ IDEA.
  User: Hamza HRAMCHI
  Date: 07/10/2020
  Time: 08:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page  contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="java.util.Collection, java.util.Iterator, h.hamza.model.HelloBean" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Abev Scriplet</title>
</head>
<body>
    <br>
    <%
        Collection<HelloBean> beanHello = (Collection<HelloBean>) session.getAttribute("beanHello");
        if (beanHello != null){
            Iterator<HelloBean> it = beanHello.iterator();
            while(it.hasNext()){
                HelloBean aBean = it.next();
    %>
    Bonjour <%= aBean.getName() %> <br>
    <%
            }
        }
    %>
</body>
</html>
