package com.ka.crud.controller;

import com.ka.crud.bean.Department;
import com.ka.crud.bean.Msg;
import com.ka.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ClassName: DepartmentController
 * @Description: TODO
 * @author: 名字
 * @date: 2022/3/9  15:29
 * 处理部门有关的请求
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> list=departmentService.getDepts();
        return Msg.success().add("depts",list);
    }
}
