<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="st" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<html>
<head>
    <title>News list</title>
    <link rel='stylesheet' href='<c:url value="webjars/bootstrap/3.2.0/css/bootstrap.css"/>'>
    <link rel="stylesheet" href="<c:url value="../style/news.css"/>">
</head>
<body>

<div class="news-header panel panel-default">
    <label><bean:message key="message.news.management"/></label>

    <st:form action="/change-locale" styleClass="select-language">
        <%--<st:submit property="locale" value="English" title="English"/>--%>
        <%--<st:submit property="locale" value="Russian" title="Russian"/>--%>
        <html:link action="/change-locale?language=russian">Russian</html:link>
        <html:link action="/change-locale?language=english">English</html:link>
    </st:form>
</div>

<div class="main-panel">
    <div class="left-part">
        <div>
            <label>News</label>
        </div>

        <div>
            <input id="newsList" name="newsOption" type="radio" onclick="document.location='/news-list.do';"
                   <c:if test="${target == 'list'}">checked</c:if>>
            <label for="newsList">News list</label>
        </div>
        <div>
            <input id="addList" name="newsOption" type="radio" onclick="document.location='/add-news.do';"
                   <c:if test="${target == 'add'}">checked</c:if>>
            <label for="addList">Add news</label>
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
                <a href="/news.do?id=${news.id}">Edit</a>
                <st:submit value="Delete" property="operationType"/>
            </div>
        </div>
    </st:form>
</div>
</body>
<script src="<c:url value="/webjars/jquery/1.11.1/jquery.js"/>"></script>
<script src="<c:url value="/webjars/bootstrap/3.2.0/js/bootstrap.js"/>"></script>
</html>
