package com.ka.crud.test;

import com.github.pagehelper.PageInfo;
import com.ka.crud.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @ClassName: MVCTest
 * @Description: TODO
 * @author: 名字
 * @date: 2022/3/7  22:12
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
//导入spring单元测试,指定Spring配置文件的位置
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
    //传入springmvc的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟mvc
    MockMvc mockMvc;
    @Before
    public void initMokcMvc(){
         mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void test() throws Exception{
        MvcResult result=mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","5")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
        System.out.println("当前页码"+pi.getPageNum());
        System.out.println("总页码"+pi.getPages());
        System.out.println("总记录数"+pi.getTotal());
        System.out.println("在页面需要连续显示的页码");
        int[] nums=pi.getNavigatepageNums();
        for (int i :
                nums) {
            System.out.print(" "+i);
        }
        //获取员工信息
        List<Employee> list = pi.getList();
        for(Employee employee:list){
            System.out.println(employee.getdId()+":->"+employee.getEmpName());
        }
    }
}
