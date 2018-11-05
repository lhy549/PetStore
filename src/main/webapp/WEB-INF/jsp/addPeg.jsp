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
    选择类型:<select name="categoryid">
        <c:forEach items="${categoryList}" var="category">
            <option value="${category.id}">${category.name}</option>
        </c:forEach>
    </select>
    照片地址：<input type="text" name="photourls">
    名字：<input type="text" name="name">
    选择标签：
    <select name="tagid">
        <c:forEach items="${tagList}" var="tag">
            <c:choose>
                <c:when test="${category.name} == ${tag.name}">
                        <option value="${tag.id}">${tag.id}</option>
                </c:when>
            </c:choose>
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
