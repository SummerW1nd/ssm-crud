package com.ka.crud.service;

import com.ka.crud.bean.Department;
import com.ka.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName: DepartmentService
 * @Description: TODO
 * @author: 名字
 * @date: 2022/3/9  15:31
 */
@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}
