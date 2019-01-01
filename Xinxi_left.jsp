<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html">
    <h:head>
        <title>Facelet Title</title>
    </h:head>
    <h:body>
        <h:panelGrid columns="2" border="2" width="200px">
            <h:outputText value="用户名" />
            <h:outputText value="#{loginBean.username}"/>
            <h:outputText value="密码"/>
            <h:outputText value="#{loginBean.password}" />
            <h:outputText value="昵称" />
            <h:outputText value="#{loginBean.nickname}" />
            <h:outputText value="性别" />
            <h:outputText value="#{loginBean.gender}" />
        </h:panelGrid>
    </h:body>
</html>

