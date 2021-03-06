<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    img{
        width: 60px;
        height: 60px;
    }
    a{padding: 10px;text-decoration:none;}
    table,td{font-size:20px;}
    a{font-size:26px;}
    button{margin: 10px 5px;}
</style>
<head>
    <title>宠物商店</title>
</head>
<body>

<input id="getSearchText" placeholder="搜索">
<button id="search">搜索</button><button id="byStatus">按状态搜索</button>
<table>
    <thead>
    <tr>
        <th>编号</th>
        <th>类型</th>
        <th>照片</th>
        <th>名字</th>
        <th>标签</th>
        <th>状态</th>
        <th>操作</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach items="${petList}" var="pet">
        <tbody>
            <tr>
                <td>${pet.id}</td>
                <td>${pet.categoryid}</td>
                <td><img src="${pet.photourls}"></td>
                <td>${pet.name}</td>
                <td>${pet.tagid}</td>
                <td>${pet.petstatus}</td>
                <td><a href="/getAddPage">添加新宠物</a></td>
                <td><a href="/delPet/${pet.id}">删除宠物</a></td>
            </tr>
        </tbody>
    </c:forEach>
</table>
</body>
<script src="js/jquery-1.11.3.min.js"></script>
<script>
    $(function(){

        $("#search").on("click",function () {
            $("#getSearchText").val();
            $.ajax({
                url:"/getPetByStatus",
                type:"get",
                data:{"SearchText":$("#getSearchText").val()},
                success:function (data) {

                }
            });

        });



    });

</script>
</html>
