<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="st" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<html>
<head>
    <title><bean:message key="message.news.view"/></title>
    <link rel='stylesheet' href='<c:url value="webjars/bootstrap/3.2.0/css/bootstrap.css"/>'>
    <link rel="stylesheet" href="<c:url value="../style/news.css"/>">
</head>
<body>

<div class="news-header panel panel-default">
    <label><bean:message key="message.news.management"/></label>

    <st:form action="/change-locale" styleClass="select-language">
        <html:link action="/change-locale?language=russian">Russian</html:link>
        <html:link action="/change-locale?language=english">English</html:link>
    </st:form>
</div>

<div class="main-panel">
    <div class="left-part">
        <div>
            <label><bean:message key="message.news.view"/></label>
        </div>
        <div>
            <input id="newsList" name="newsOption" type="radio" onclick="document.location='/news-list.do';"
                   <c:if test="${target == 'list'}">checked</c:if>>
            <label for="newsList"><bean:message key="message.news.list"/></label>
        </div>
        <div>
            <input id="addList" name="newsOption" type="radio" onclick="document.location='/add-news.do';"
                   <c:if test="${target == 'add'}">checked</c:if>>
            <label for="addList"><bean:message key="message.add.news"/></label>
        </div>
    </div>

    <st:errors/>

    <st:form action="/submit-form" styleClass="news-block panel panel-default">
        <st:hidden property="id" value="${news.id}"/>

        <div class="news-block-header text-center">
            <div>${news.title}</div>
            <label>${news.getDateString()}</label>
        </div>
        <br/>
        <hr class="hr-header">
        <div class="news-block-content panel panel-default">
            <div>${news.content}</div>
        </div>
        <div class="clear"></div>

        <div class="article-operations">
            <div class="article-operations">
                <a href="/news.do?id=${news.id}"><bean:message key="message.news.edit"/></a>
                <st:hidden property="operationType" value="Delete"/>
                <button type="submit"><bean:message key="message.delete"/></button>
            </div>
        </div>
    </st:form>
</div>
</body>
<script src="<c:url value="/webjars/jquery/1.11.1/jquery.js"/>"></script>
<script src="<c:url value="/webjars/bootstrap/3.2.0/js/bootstrap.js"/>"></script>
</html>
