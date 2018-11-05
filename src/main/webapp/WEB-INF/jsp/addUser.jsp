<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery-1.11.3.min.js"></script>
<html>
<head>
    <title>新用户注册</title>
</head>
<body>
<form>
    <input type="text" id="username"  placeholder="请输入昵称"><br/><br/>
    <input type="text" id="firstname"  placeholder="请输入名字"><br/><br/>
    <input type="text" id="lastname"  placeholder="请输入姓氏"><br/><br/>
    <input type="text" id="email"  placeholder="请输入邮箱"><br/><br/>
    <input type="password" id="password"  placeholder="请输入密码"><br/><br/>
    <input type="text" id="phone"  placeholder="请输入电话"><br/><br/>
    <input type="number" id="userstatus" placeholder="请输入状态"><br/><br/>
    <input type="button" id="register" value="注册">
</form>
</body>

<script>
    $(function(){
        $("#register").on("click",function () {
           var  user1 ={
                    "username":$("#username").val(),
                    "firstname":$("#firstname").val(),
                    "lastname":$("#lastname").val(),
                    "email":$("#email").val(),
                    "password":$("#password").val(),
                    "phone":$("#phone").val(),
                    "userstatus":$("#userstatus").val()
            };
            $.ajax({
                url :'/addUser',
                type:'POST',
                data:JSON.stringify(user1),
                contentType :'application/json',
                dataType:'json',
                success :function(data) {
                    alert(data);
                   console.log(data);
                    window.location.href = "/pet";
                },
                fail:function(data){
                    alert(data);
                    console.log(data);
                },
                error :function(e) {
                    alert("error");
                }
        })
        })
    });
</script>
</html>
