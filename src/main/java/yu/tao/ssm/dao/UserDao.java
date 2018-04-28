package yu.tao.ssm.dao;
import yu.tao.ssm.model.User;
public interface  UserDao {
    int deleteByPrimaryKey(Integer id);
  
    int insertSelective(User record);

    int insert(User record);

//    User selectByPrimaryKey(Integer id);

    User selectByPrimaryusername(String user_name);

    User selectByPrimarypassword(String password);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}
