<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
    input{
        margin: 3px 20px;
    }
    a{text-decoration: none}
    h3{margin: 10px 20px}
</style>
<body>
<h3>用户登录</h3>
<form>
    <input type="text" id="userName" placeholder="请输入账号"/><br/><br/>
    <input type="password" id="userPwd" placeholder="请输入密码"/><br/><br/>
    <input  id="login" type="button" value="登录"/><a href="/addPage">新用户注册?</a>
</form>
</body>
<script src="js/jquery-1.11.3.min.js"></script>
<script>
    $(function(){
        $("#login").on("click",function () {
            $.ajax({
                url:"/checkLogin",
                type:"get",
                data:{"userName":$("#userName").val(),"userPwd":$("#userPwd").val()},
                success:function (data) {
                    if(data.msg === "PasswordError!"){
                        $("#userPwd").val("");
                    }else {
                        window.location.href = "/pet";
                    }
                    console.log(data.msg);
                    alert(data.msg);
                }
            });
        });
    });
</script>
</html>
