<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/3/8
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:forward page="/emps"></jsp:forward>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
          th:href="@{/webjars/bootstrap/3.3.7/css/bootstrap.min.css}">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
            th:src="@{webjars/jquery/3.3.1/jquery.min.js}"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            th:src="@{/webjars/bootstrap/3.3.7/js/bootstrap.min.js}"></script>
</head>
<body>
<a class="btn btn-default" th:href="@{/WEB-INF/views/list.jsp}" role="button">Link</a>
</body>
</html>
