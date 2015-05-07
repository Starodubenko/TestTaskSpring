<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>News list</title>
    <link rel='stylesheet' href='<c:url value="webjars/bootstrap/3.2.0/css/bootstrap.css"/>'>
    <link rel="stylesheet" href="<c:url value="../style/news.css"/>">
</head>
<body>

<h1 class="news-header">Новости</h1>

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

    <form name="navForm" class="news-block panel panel-default">
        <div class="news-block-header text-center">
            <div>
                <label><a href="/news-list.do">News list</a></label> <label>>></label>
                <c:if test="${target == 'list'}"><label>News</label></c:if>
                <c:if test="${target == 'add'}"><label>Add news</label></c:if>
            </div>

            <div><label>News title</label></div>
            <div class="form-group input-block">
                <input type="text" name="title" class="form-control color-tooltip input" value="<c:if test="${not empty news}">${news.title}</c:if>">
            </div>
            <div>
                <label>News date</label>
            </div>
            <div class="form-group input-block">
                <input type="text" name="date" class="form-control color-tooltip input" value="<c:if test="${not empty news}">${news.date}</c:if>">
            </div>

        </div>
        <br/>
        <hr class="hr-header">
        <div><label>Brief</label></div>
        <div class="news-block-content panel panel-default">
            <textarea name="brief" class="form-control" rows="5"><c:if test="${not empty news}">${news.brief}</c:if></textarea>
        </div>
        <div><label>Content</label></div>
        <div class="news-block-content panel panel-default">
            <textarea name="content" class="form-control" rows="23"><c:if test="${not empty news}">${news.content}</c:if></textarea>
        </div>

        <div class="clear"></div>

        <div class="article-operations">
            <div class="article-operations">
                <c:if test="${target == 'add' or not empty news}">
                    <button id="save">Save</button>
                </c:if>
                <c:if test="${target == 'list'}">
                    <button id="remove">Delete</button>
                </c:if>
            </div>
        </div>
    </form>
</div>


</body>
<script src="<c:url value="/webjars/jquery/1.11.1/jquery.js"/>"></script>
<script src="<c:url value="/webjars/bootstrap/3.2.0/js/bootstrap.js"/>"></script>
</html>
