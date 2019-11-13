package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import shenbo.crud.bean.Department;
import shenbo.crud.bean.Employee;
import shenbo.crud.dao.DepartmentMapper;
import shenbo.crud.dao.EmployeeMapper;

import java.util.UUID;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestMapper {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;


    @Autowired
    SqlSession sqlSession;


    @Test
    public void test(){

//        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        DepartmentMapper bean = context.getBean(DepartmentMapper.class);
//
//        System.out.println(bean);

//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));

        //employeeMapper.insertSelective(new Employee(null,"Shen","M","Shenbomaster@163.com",2));

        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);

        for (int i = 0; i < 1000; i++) {
            String uuid = UUID.randomUUID().toString().substring(0,5);
            mapper.insertSelective(new Employee(null,uuid,"M",uuid+"@163.com",1));
        }


    }
}
