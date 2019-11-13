package shenbo.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import shenbo.crud.bean.Department;
import shenbo.crud.bean.Msg;
import shenbo.crud.service.DepartmentService;

import java.util.List;

@Controller
public class DepartmentController {


    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> depts = departmentService.getDepts();
        return Msg.success().add("depts",depts);

    }
}
