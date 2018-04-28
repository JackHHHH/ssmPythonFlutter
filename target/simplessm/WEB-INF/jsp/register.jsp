<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/4/27
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html>

        <head>

            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">


            <title>H+ 后台主题UI框架 - 注册</title>
            <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
            <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

            <link rel="shortcut icon" href="favicon.ico">
            <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
            <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
            <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
            <link href="css/animate.css" rel="stylesheet">
            <link href="css/style.css?v=4.1.0" rel="stylesheet">
            <script>
                if (window.top !== window.self) {
                    window.top.location = window.location;
                }
            </script>

        </head>

        <body class="gray-bg">

            <div class="middle-box text-center loginscreen   animated fadeInDown">
                <div>
                    <div>

                        <h1 class="logo-name">YT</h1>

                    </div>
                    <h3>您可以用测试账号登录</h3>
                    <p>yutao ==>yutao168</p>

                    <div class="form-group">
                        <input type="text" class="form-control username" placeholder="请输入用户名" required="">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control password1" placeholder="请输入密码" required="">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control password2" placeholder="请再次输入密码" required="">
                    </div>
                    <div class="form-group text-left">
                        <div class="checkbox i-checks">
                            <label class="no-padding">
                        <input type="checkbox"><i></i> 我同意注册协议</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>

                    <p class="text-muted text-center"><small>已经有账户了？</small><a href="login.html">点此登录</a>
                    </p>


                </div>
            </div>

            <!-- 全局js -->
            <script src="js/jquery.min.js?v=2.1.4"></script>
            <script src="js/bootstrap.min.js?v=3.3.6"></script>
            <!-- iCheck -->
            <script src="js/plugins/iCheck/icheck.min.js"></script>
            <script src="https://cdn.bootcss.com/layer/3.1.0/layer.js"></script>
            <script>
                $(document).ready(function() {
                    $('.i-checks').iCheck({
                        checkboxClass: 'icheckbox_square-green',
                        radioClass: 'iradio_square-green',
                    });
                });
            </script>
            <script>
                $(".btn-primary").click(function() {
                    var username = $(".username").val(),
                        password1 = $(".password1").val(),
                        password2 = $(".password2").val(),
                        bool = $(".icheckbox_square-green").hasClass('checked');
                    console.log(bool)

                    if (!username) {
                        parent.layer.msg('用户名不能为空');
                    } else if (!password1) {
                        parent.layer.msg("密码不能为空")
                    } else if (password1 != password2) {
                        parent.layer.msg("两次密码不一致")
                    } else if (!bool) {
                        parent.layer.msg("请同意")
                    } else {
                        $.ajax({
                            type: "get",
                            url: "/registerdata",
                            data: {
                                "username": username,
                                "password": password2
                            },
                            dataType: "json",
                            success: function(data) {
                                console.log(data)
                                if (data.code == 200) {
                                    // console.log(data.msg)
                                    window.location.href = "http://127.0.0.1:8080" + data.msg
                                }
                            },
                            error: function(err) {
                                console.log(err)
                            }
                        });
                    }
                });
            </script>


        </body>

        </html>