package yu.tao.ssm.service;
import yu.tao.ssm.model.User;


public interface IUserService {
    public  User getUserByUserName(String user_name);
    public  User getUserByPassWord(String password);
    public  void insertUsernamePassword(User record);
}