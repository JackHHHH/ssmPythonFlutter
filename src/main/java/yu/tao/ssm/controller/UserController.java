package yu.tao.ssm.controller;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import yu.tao.ssm.model.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import yu.tao.ssm.service.IUserService;

@Controller
@RequestMapping("/")
public class UserController {

    @Resource
    private IUserService userService;

    // 登录模块的响应
    @RequestMapping(value="/login",method = RequestMethod.GET,produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String showUser(HttpServletRequest request, Model model,HttpServletResponse rsp)   {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User  usernamebyservice = this.userService.getUserByUserName(username);
        User passwordbyservuce = this.userService.getUserByPassWord(password);
        System.out.println(username);
        UserCode u =new UserCode();
        System.out.println("从数据库查询成功，下一步把数据传给前端模板");
            if(username==null||username.length() == 0) {
                System.out.println("用户名不能为空");
                u.setCode(1);
                u.setName("用户名不能为空");

            }else if(password==null||password.length() == 0){
                System.out.println("密码不能为空");
                u.setCode(2);
                u.setName("密码不能为空");
            }else if(usernamebyservice==null){
                System.out.println("用户名不存在");
                u.setCode(3);
                u.setName("用户名不存在");
            }else if(passwordbyservuce==null){
                System.out.println("密码错误");
                u.setCode(4);
                u.setName("密码错误");
            }else {
                System.out.println("登录成功");
                u.setCode(200);
                u.setName("/index_v");
            }

        //绑定对象到User.jsp
        //        model.addAttribute("user",user);
        //        return "User";
        return "{\"code\":\""+u.getCode()+"\",\"msg\":\""+u.getName()+"\"}";
    }

    // 跳转到注册页
    @RequestMapping(value="/register",method = RequestMethod.GET,produces="text/html;charset=UTF-8;")
    public String register(HttpServletRequest request){
        return  "register";
    }

    // 注册模块的响应
    @RequestMapping(value="/registerdata",method = RequestMethod.GET,produces="text/html;charset=UTF-8;")
    @ResponseBody
    public String registerdata(HttpServletRequest request, Model model,HttpServletResponse rsp) {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        UserCode u =new UserCode();
        if(username==null||username.length() == 0) {
            System.out.println("用户名不能为空");
            u.setCode(1);
            u.setName("用户名不能为空");

        }else if(password==null||password.length() == 0){
            System.out.println("密码不能为空");
            u.setCode(2);
            u.setName("密码不能为空");
        }else{
            User news=new User();
            news.setUserName(username);
            news.setPassword(password);
            news.setAge(20);
            this.userService.insertUsernamePassword(news);
            u.setCode(200);
            u.setName("/index_v");

        }
        return "{\"code\":\""+u.getCode()+"\",\"msg\":\""+u.getName()+"\"}";
    }


    // 跳转到主页
    @RequestMapping(value="/index_v",method = RequestMethod.GET,produces="text/html;charset=UTF-8;")
    public String index_v(HttpServletRequest request){
        return  "index_v";
    }

        // // v3展示
        // @RequestMapping(value="/index_v3",method = RequestMethod.GET,produces="text/html;charset=UTF-8;")
        // public String index_v3(HttpServletRequest request){
        //     return  "index_v3";
        // }
}