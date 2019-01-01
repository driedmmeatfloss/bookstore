
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h1 style="text-align: center">个人信息</h1>
    <table border="2" style="margin: 0 auto;width: 40%">
        <tr>
            <td>用户名</td>
            <td>${requestScope.username}</td>
        </tr>
        <tr>
            <td>密码</td>
            <td>${requestScope.password}</td>
        </tr>
        
        <tr>
            <td>昵称</td>
            <td>${requestScope.nickname}</td>
        </tr>
        <tr>
            <td>性别</td>
            <td>${requestScope.gender}</td>
        </tr>
    </table>
        <h3 style="text-align: center;color: red">修改信息，请尽快联系管理员</h3>
</body>
</html>
