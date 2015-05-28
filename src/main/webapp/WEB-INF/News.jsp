<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="st" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<html>
<head>
    <title><bean:message key="message.news"/></title>
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
            <label><bean:message key="message.news"/></label>
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

    <st:form action="/submit-form" styleClass="news-block panel panel-default">
        <c:if test="${not empty news.id}">
            <st:hidden property="id" value="${news.id}"/>
        </c:if>
        <c:if test="${empty news.id}">
            <st:hidden property="id" value=""/>
        </c:if>

        <div class="news-block-header text-center">
            <div>
                <label><a href="/news-list.do"><bean:message key="message.news.list"/></a></label> <label>>></label>
                <c:if test="${target == 'list'}"><label><bean:message key="message.news"/></label></c:if>
                <c:if test="${target == 'add'}"><label><bean:message key="message.add.news"/></label></c:if>
            </div>

            <div><label><bean:message key="message.news.title"/></label></div>
            <div class="form-group input-block">
                <st:text value="${news.title}" property="title" styleClass="form-control color-tooltip input"/>
                <div style="color: red"><st:errors property="title"/></div>
            </div>
            <div>
                <label><bean:message key="message.news.date"/></label>
            </div>
            <div class="form-group input-block">
                <st:text value="${news.getDateString()}" property="newsDate" styleClass="form-control color-tooltip input"/>

                <div style="color: red"><st:errors property="newsDate"/></div>
            </div>
        </div>
        <br/>
        <hr class="hr-header">
        <div><label><bean:message key="message.news.brief"/></label></div>
        <div class="form-group input-block news-block-content text-center">
            <st:textarea value="${news.brief}" property="brief" styleClass="form-control color-tooltip input"/>

            <div style="color: red"><st:errors property="brief"/></div>
        </div>
        <br/>
        <div><label><bean:message key="message.news.content"/></label></div>
        <div class="form-group input-block news-block-content text-center">
            <st:textarea value="${news.content}" property="content" styleClass="form-control color-tooltip input"/>

            <div style="color: red"><st:errors property="content"/></div>
        </div>

        <div class="clear"></div>
        <div class="article-operations">
            <div class="article-operations">
                <c:if test="${target == 'add'}">
                    <st:hidden property="operationType" value="Save"/>
                    <button type="submit"><bean:message key="message.save"/></button>
                </c:if>
                <c:if test="${not empty news}">
                    <st:hidden property="operationType" value="Update"/>
                    <button type="submit"><bean:message key="message.update"/></button>
                </c:if>

            </div>
        </div>
    </st:form>
    <st:form action="/delete-news">
        <c:if test="${target == 'list'}">
            <st:hidden property="id" value="${news.id}"/>
            <st:hidden property="operationType" value="Delete"/>
            <button type="submit"><bean:message key="message.delete"/></button>
        </c:if>
    </st:form>
</div>


</body>
<script src="<c:url value="/webjars/jquery/1.11.1/jquery.js"/>"></script>
<script src="<c:url value="/webjars/bootstrap/3.2.0/js/bootstrap.js"/>"></script>
</html>
