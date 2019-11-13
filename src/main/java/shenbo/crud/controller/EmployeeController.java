package shenbo.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import shenbo.crud.bean.Employee;
import shenbo.crud.bean.Msg;
import shenbo.crud.service.EmployeeService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;



    @ResponseBody
    @RequestMapping(value ="/checkuser",method = RequestMethod.POST)
    public Msg checkName(@RequestParam("empName") String empName){

       // System.out.println("这里是名字:"+empName);
       boolean b =  employeeService.checkUser(empName);
       if(b){
           return Msg.success();
       }else{
           return Msg.fail().add("va_msg","用户名不可用");
       }
    }

    @ResponseBody
    @RequestMapping(value ="/emp",method = RequestMethod.POST)
    public Msg saveEmp(Employee employee){
        employeeService.saveEmp(employee);
        return Msg.success();
    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpInJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn,
                            @RequestParam(value="empName") String EmpName){

        System.out.println(pn+"  "+EmpName);
        PageHelper.startPage(pn,6);
        List<Employee> all = employeeService.getAll(EmpName);
        PageInfo page = new PageInfo(all,4);
        return Msg.success().add("pageInfo",page);
    }

    //@RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//
//        PageHelper.startPage(pn,6);
//
//        List<Employee> all = employeeService.getAll();
//
//        PageInfo page = new PageInfo(all,4);
//
//        model.addAttribute("pageInfo",page);
//
//        return "list";
//    }


    @ResponseBody
    @RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
    public Msg getEmp(@PathVariable("id")Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }


    @ResponseBody
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    public Msg updateEmp(Employee employee){

        //System.out.println(employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("empId") String id){
        System.out.println("这里是id"+id);

        if(id.contains("-")){
            List<Integer> del_ids = new ArrayList<>();
            String[] str_id = id.split("-");
            for(String strid:str_id){
                del_ids.add(Integer.valueOf(strid));
            }

            employeeService.deleteBatch(del_ids);

        }else{
            employeeService.deleteEmp(Integer.parseInt(id));
        }

        return Msg.success();
    }

}
