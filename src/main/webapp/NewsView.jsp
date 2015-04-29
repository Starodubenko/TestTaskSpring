<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>News list</title>
    <link rel='stylesheet' href='<c:url value="webjars/bootstrap/3.2.0/css/bootstrap.css"/>'>
    <link rel="stylesheet" href="<c:url value="style/news.css"/>">
</head>
<body>

<h1 class="news-header">Новости</h1>

<div class="main-panel">
    <div class="left-part">
        <div>
            <label>News</label>
        </div>

        <div>
            <input id="newsList" name="newsOption" type="radio" value="">
            <label for="newsList">News list</label>
        </div>
        <div>
            <input id="addList" name="newsOption" type="radio" value="Add news">
            <label for="addList">Add news</label>
        </div>
    </div>

    <div class="news-block panel panel-default">

        <div class="news-block-header text-center">
            <div>
                <label><a href="NewsList.jsp">News list</a></label><label>>></label><label>News view</label>
            </div>

            <%--<div class="form-group input-block">--%>
            <%--<input type="text" name="title" class="form-control color-tooltip input" value="<c:if test="${not empty article}">${article.title}</c:if>">--%>
            <%--<input type="text" name="title" class="form-control color-tooltip input" value="">--%>
            <%--</div>--%>
            <%--<div><c:if test="${not empty article}">${article.title}</c:if></div>--%>
            <div>Title of news</div>
            <label>01.05.2015</label>
        </div>
        <br/><br/>
        <hr class="hr-header">
        <div class="news-block-content panel panel-default">
            <%--<textarea class="form-control" rows="23">NewsNewsNewsNewsNewsNewsNewsNewsNewsNewsNewsNewsNews</textarea>--%>
            <%--<textarea class="form-control" rows="23"><c:if test="${not empty article}">${article.text}</c:if></textarea>--%>

            <div>NewsNewsNewsNewsNewsNewsNewsNewsNewsNewsNewsNewsNews</div>
        </div>

        <div class="clear"></div>

        <div class="article-operations">
            <input type="checkbox" value=""/>
            <a href="News.jsp">Edit</a>
            <button>Delete</button>
        </div>
    </div>
</div>
</body>
<script src="<c:url value="/webjars/jquery/1.11.1/jquery.js"/>"></script>
<script src="<c:url value="/webjars/bootstrap/3.2.0/js/bootstrap.js"/>"></script>
</html>
