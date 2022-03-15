package com.ka.crud.test;

import com.ka.crud.bean.Department;
import com.ka.crud.bean.Employee;
import com.ka.crud.dao.DepartmentMapper;
import com.ka.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @ClassName: MapperTest
 * @Description: TODO
 * @author: 名字
 * @date: 2022/3/4  16:39
 */
@RunWith(SpringJUnit4ClassRunner.class)
//导入spring单元测试,指定Spring配置文件的位置
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;
    @Test
    public void testCRUD(){
//        //创建ioc容器
//        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        //从容器中获取mapper
//        DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
        System.out.println(departmentMapper);

        //1. 插入几个部门
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));

        //2.插入几个职员
//        employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@qq.com",1));
//        3.插入多个员工
//          for(){
//              employeeMapper.insertSelective(new Employee(null,,"M","Jerry@qq.com",1));
//          }

        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i=0;i<1000;++i){
            String uid = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insert(new Employee(null,uid,"M",uid+"@qq.com",1));
            System.out.println(i);
        }
    }
}
