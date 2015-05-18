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

    <st:form action="/submit-add-form" styleClass="news-block panel panel-default">

        <st:hidden property="id" value="${news.id}"/>

        <div class="news-block-header text-center">
            <div>
                <label><a href="/news-list.do">News list</a></label> <label>>></label>
                <c:if test="${target == 'list'}"><label>News</label></c:if>
                <c:if test="${target == 'add'}"><label>Add news</label></c:if>
            </div>

            <div><label>News title</label></div>
            <div class="form-group input-block">
                <st:text value="${news.title}" property="title" styleClass="form-control color-tooltip input"/>
            </div>
            <div>
                <label>News date</label>
            </div>
            <div class="form-group input-block">
                <st:text value="${news.date}" property="date" styleClass="form-control color-tooltip input"/>
            </div>

        </div>
        <br/>
        <hr class="hr-header">
        <div><label>Brief</label></div>
        <div class="news-block-content panel panel-default">
            <st:textarea value="${news.brief}" property="brief" styleClass="form-control color-tooltip input"/>
        </div>
        <div><label>Content</label></div>
        <div class="news-block-content panel panel-default">
            <st:textarea value="${news.content}" property="content" styleClass="form-control color-tooltip input"/>
        </div>
        <div class="clear"></div>
        <div class="article-operations">
            <div class="article-operations">
                <c:if test="${target == 'add'}">
                    <st:submit value="Save" property="operationType"/>
                </c:if>
                <c:if test="${not empty news}">
                    <st:submit value="Update" property="operationType"/>
                </c:if>
                <c:if test="${target == 'list'}">
                    <st:submit value="Delete" property="operationType"/>
                </c:if>
            </div>
        </div>
    </st:form>
</div>


</body>
<script src="<c:url value="/webjars/jquery/1.11.1/jquery.js"/>"></script>
<script src="<c:url value="/webjars/bootstrap/3.2.0/js/bootstrap.js"/>"></script>
</html>
