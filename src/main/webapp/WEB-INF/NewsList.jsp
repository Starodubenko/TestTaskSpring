<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="st" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>


<html>
<head>
    <title><bean:message key="message.news.list"/></title>
    <link rel='stylesheet' href='<c:url value="webjars/bootstrap/3.2.0/css/bootstrap.css"/>'>
    <link rel="stylesheet" href="<c:url value="../style/news.css"/>">
</head>
<body>

<div class="news-header panel panel-default">
    <label><bean:message key="message.news.management"/></label>

    <st:form action="/change-locale" styleClass="select-language">
        <html:link action="/change-locale?language=russian&id=${news.id}">Russian</html:link>
        <html:link action="/change-locale?language=english&id=${news.id}">English</html:link>
    </st:form>
</div>

<div class="main-panel">
    <div class="left-part">
        <div>
            <label><bean:message key="message.news.list"/></label>
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

    <st:form action="/delete-news">
        <div class="news-block panel panel-default">
            <div>
                <label><bean:message key="message.news.list"/></label>
            </div>
            <c:forEach var="news" items="${newses}">
                <div class="news-block-header text-center">
                    <div>${news.title}</div>
                    <label>${news.getDateString()}</label>
                </div>
                <div class="clear"></div>
                <hr class="hr-header">
                <div class="news-block-content panel panel-default">
                    <div>${news.brief}</div>
                </div>
                <div class="clear"></div>

                <div class="article-operations">
                    <input type="checkbox" name="delArray" value="${news.id}"/>
                    <a href="/news-view.do?id=${news.id}"><bean:message key="message.news.view"/></a>
                    <a href="/news.do?id=${news.id}"><bean:message key="message.news.edit"/></a>
                </div>
                <div class="clear"></div>
                <br/>
            </c:forEach>
        </div>
        <st:hidden property="operationType" value="Delete checked"/>
        <button type="submit"><bean:message key="message.delete.checked"/></button>
    </st:form>
</div>


</body>
<script src="<c:url value="/webjars/jquery/1.11.1/jquery.js"/>"></script>
<script src="<c:url value="/webjars/bootstrap/3.2.0/js/bootstrap.js"/>"></script>
</html>