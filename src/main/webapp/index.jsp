<%@page language="java" contentType="text/html; charset=utf-8"
        pageEncoding="utf-8"%>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="renderer" content="webkit">
        <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
        <title></title>
        <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
        <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet" />
        <link href="css/animate.css" rel="stylesheet" />
        <link href="css/style.css?v=4.1.0" rel="stylesheet" />
    </head>

    <body class="gray-bg">

        <div class="middle-box text-center loginscreen  animated fadeInDown">
            <div>
                <div>

                    <h1 class="logo-name">YT</h1>

                </div>
                <h3 class="title">于桃欢迎你</h3>


                <div class="form-group">
                    <input type="text" class="form-control user" placeholder="用户名" required="" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control password" placeholder="密码" required="" />
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>


                <p class="text-muted text-center"> <a href="jsp/index_v.jsp"><small>忘记密码了？</small></a> | <a href="register">注册一个新账号</a>
                </p>


            </div>
        </div>

        <!-- 全局js -->
        <script src="js/jquery.min.js?v=2.1.4"></script>
        <script src="js/bootstrap.min.js?v=3.3.6"></script>
        <script src="https://cdn.bootcss.com/layer/3.1.0/layer.js"></script>
        <script>
            $(".btn-primary").click(function() {
                var user = $(".user").val(),
                    password = $(".password").val();
                if (!user) {
                    parent.layer.msg('用户名不能为空');

                } else if (!password) {
                    parent.layer.msg('密码不能为空');
                } else {
                    $.ajax({
                        type: "get",
                        url: "/login",
                        data: {
                            "username": user,
                            "password": password
                        },
                        dataType: "json",
                        success: function(data) {
                            console.log(data)
                            if (data.code != 200) {
                                parent.layer.msg(data.msg);
                            } else {

                                window.location.href = "http://127.0.0.1:8080" + data.msg
                            }


                        },
                        error: function(err) {
                            console.log(err)
                        }
                    });
                }
            })
        </script>

    </body>

    </html>