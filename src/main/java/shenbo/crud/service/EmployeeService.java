package shenbo.crud.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shenbo.crud.bean.Employee;
import shenbo.crud.bean.EmployeeExample;
import shenbo.crud.dao.EmployeeMapper;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll(String empName){
        if (empName != null || !"".equals(empName.trim())) {

            return employeeMapper.selectByLike(empName);
        }else{
            return employeeMapper.selectByExampleWithDept(null);
        }
    }


    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    public boolean checkUser(String empName) {
        long count = employeeMapper.countByExample(empName);
        return count == 0;
    }

    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> del_ids) {
          for(int i=0;i<del_ids.size();i++){
              employeeMapper.deleteByPrimaryKey(del_ids.get(i));
          }
    }
}
