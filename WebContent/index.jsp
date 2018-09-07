<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>登录页面</title>
    <link rel="stylesheet" href="<%=path %>/threeparts/layui-2.3.0/css/layui.css">
    <link rel="stylesheet" href="<%=path %>/css/login.css">
    <script type="text/javascript" src="<%=path %>/threeparts/layui-2.3.0/layui.js" charset="utf-8"></script>
</head>
<body>
<div class="m-login-bg">
    <div class="m-login">
        <h3>后台管理系统登录</h3>
        <div class="m-login-warp">
            <form class="layui-form" method="post" action="index.html">
                <div class="layui-form-item">
                    <input type="text" name="username"  lay-verify="required|username" placeholder="用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="password" name="password" required lay-verify="required|password" placeholder="密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <input type="text" name="verity" required lay-verify="required|verity" placeholder="验证码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-inline">
                        <img class="verifyImg"  src="images/login/yzm.jpg" />
                    </div>
                </div>
                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">登录</button>
                    </div>
                    <div class="layui-inline">
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
        <p class="copyright">Copyright 2018-2019 by YangJie</p>
    </div>
</div>

<script>
    //默认账号密码
    var truelogin = "123456";
    var truepwd = "123456";
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form,
            layer = layui.layer;

        var msgalert = '默认账号:' + truelogin + '<br/> 默认密码:' + truepwd;
        var index = layer.alert(msgalert, { icon: 6, time: 4000, offset: 't', closeBtn: 0, title: '友情提示', btn: [], anim: 2, shade: 0 });
        layer.style(index, {
            color: '#777'
        });

        //自定义验证规则
        form.verify({
            username: function(value) {
                if(value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
            password: [/(.+){6,12}$/, '密码必须6到12位'],
            verity: [/(.+){6}$/, '验证码必须是6位'],

        });


        //监听提交
        form.on('submit(login)', function(data) {

            if(data.field.username!="123456"){
                layer.alert("用户名错误！", {
                    title: '系统信息'
                });
                return false;
            }else if(data.field.password!="123456"){
                layer.alert("密码错误！", {
                    title: '系统信息'
                });
                return false;
            }else if(data.field.verity!="4wa62z"){
                layer.alert("验证码错误！", {
                    title: '系统信息'
                });
                return false;
            }


        });

    });
</script>
</body>
</html>