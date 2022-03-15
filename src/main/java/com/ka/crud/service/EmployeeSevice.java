package com.ka.crud.service;

import com.ka.crud.bean.Employee;
import com.ka.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName: EmployeeSevice
 * @Description: TODO
 * @author: 名字
 * @date: 2022/3/7  21:51
 */
@Service
public class EmployeeSevice {
    @Autowired
    EmployeeMapper employeeMapper;
    //查询所有员工
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }
}
