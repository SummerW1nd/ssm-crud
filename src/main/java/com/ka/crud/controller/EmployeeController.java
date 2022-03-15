package com.ka.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ka.crud.bean.Employee;
import com.ka.crud.bean.Msg;
import com.ka.crud.service.EmployeeSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ClassName: EmployeeController
 * @Description: TODO
 * @author: 名字
 * @date: 2022/3/7  21:43
 */
// 处理员工增删改查
@Controller
public class EmployeeController {
    @Autowired
    EmployeeSevice employeeSevice;


    //员工保存
    @RequestMapping(value = "/emps" ,method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(Employee employee) {
        employeeSevice.saveEmp(employee);
        return Msg.success();
    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //这不是一个分页查询
        //引入pageHelper插件
        PageHelper.startPage(pn,5);
        //startPage后边紧跟的查询时分页查询
        List<Employee> emps=employeeSevice.getAll();
        //pageINfo封装了详细的分页信息,连续显示的页数（5）
        PageInfo page = new PageInfo(emps,5);
        return Msg.success().add("pageInfo",page);
    }

//    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        //这不是一个分页查询
        //引入pageHelper插件
        PageHelper.startPage(pn,5);
        //startPage后边紧跟的查询时分页查询
        List<Employee> emps=employeeSevice.getAll();
        //pageINfo封装了详细的分页信息,连续显示的页数（5）
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }
}
