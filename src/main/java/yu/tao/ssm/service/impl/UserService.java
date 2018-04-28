package yu.tao.ssm.service.impl;

import org.springframework.stereotype.Service;
import yu.tao.ssm.dao.UserDao;
import yu.tao.ssm.model.User;
import yu.tao.ssm.service.IUserService;

import javax.annotation.Resource;

@Service("userService")
public class UserService implements IUserService {

    @Resource
    private UserDao userdao;
    // 通过ID查询
    //    public User getUserByID(int id) {
    //        return this.userdao.selectByPrimaryKey(id);
    //    }

    // 通过用户名查询数据库
    public  User getUserByUserName(String user_name){
        return  this.userdao.selectByPrimaryusername(user_name);
    }

    // 通过密码查询数据库
    public  User getUserByPassWord(String password){

        return  this.userdao.selectByPrimarypassword(password);
    }

    // 插入新用户
    public void insertUsernamePassword(User record){
        this.userdao.insert(record);
    }
}