<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    input{margin: 3px 20px;}
</style>
<head>
    <title>添加宠物</title>
</head>
<body>
<form>
    <input type="text" name="id">
    <select name="categoryid">
        <c:forEach items="${categoryList}" var="category">
            <option name="${category.name}">${category.name}</option>
        </c:forEach>
    </select>
    <input type="text" name="name">
    <input type="text" name=" photourls">
    <select name="tagid">
        <c:forEach items="${tagList}" var="tag">
            <option name="${tag.id}">${tag.id}</option>
        </c:forEach>
    </select>
    <select name="Petstatus">
        <option value="Petstatus">可用</option>
        <option value="pending">待定</option>
        <option value="sold">已售出</option>
    </select>
</form>
</body>
</html>
