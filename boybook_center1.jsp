
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center">交易记录</h1>
         <table border="1" align="center" style="width: 80%">
           
            
            <tr>
                <td>书名</td> 
                <td>姓名</td> 
                <td>金额</td> 
                <td>时间</td> 
            </tr>
            <c:forEach items="${requestScope.bookname}" var="l" varStatus="vs">
                <tr>
                    
                    <td>${l}</td>
                    <td>${requestScope.name.get(vs.index)}</td>
                    <td>${requestScope.monry.get(vs.index)}</td>
                    <td>${requestScope.date.get(vs.index)}</td>
                    
                </tr>
            </c:forEach>
            
        </table>
    </body>
</html>
