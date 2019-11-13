package shenbo.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shenbo.crud.bean.Department;
import shenbo.crud.dao.DepartmentMapper;

import java.util.List;

@Service
public class DepartmentService {


    @Autowired
    private DepartmentMapper departmentMapper;


    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
