<%--
  Created by IntelliJ IDEA.
  User: shenbo
  Date: 2019/11/7
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>员工列表</title>

    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script  type="text/javascript" src="${APP_PATH}/static/jsfiles/jquery-1.12.4.min.js" ></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js2/bootstrap.min.js"></script>
</head>
<body>


<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>


    <%--搜索    --%>
    <div class="row">
        <div class="col-md-4">
            按姓名模糊查询：<input type="text" name="empName" id="searchInput">
            <button id="search_emp_btn" class="btn btn-default">搜索</button>
        </div>
    </div>

    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="addnewEmpBtn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>
                        <input type="checkbox" id="check_all"/>
                        </th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>

            </table>
        </div>
    </div>
    <%--页码条--%>
    <div class="row">
        <%--总记录数--%>
        <div class="col-md-8" id="page_info_area"></div>

        <%--信息条--%>
        <div class="col-md-4" id="page_nav_area"></div>
    </div>

    <%--增加员工信息--%>
        <div class="modal fade" tabindex="-1" role="dialog" id="empAddModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">员工添加</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">empName</label>
                                <div class="col-sm-10">
                                    <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">email</label>
                                <div class="col-sm-10">
                                    <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@shenbo.com">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">gender</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">deptName</label>
                                <div class="col-sm-4">
                                    <!-- 部门提交部门id即可 -->
                                    <select class="form-control" name="dId">
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        <%--员工修改--%>
        <div class="modal fade" tabindex="-1" role="dialog" id="empUpdateModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">员工修改</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">empName</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static" id="empName_update_static">

                                    </p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">email</label>
                                <div class="col-sm-10">
                                    <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@shenbo.com">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">gender</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">deptName</label>
                                <div class="col-sm-4">
                                    <!-- 部门提交部门id即可 -->
                                    <select class="form-control" name="dId">
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


</div>
        <script type="text/javascript">

            var totalRecord,currentPage,totalPage;
            var empName = "";

            $(function(){
                //去首页
                to_page(1,null);
            });


            $("#empName_add_input").change(function () {

                //1、拿到要校验的数据，使用正则表达式
                var empName = $("#empName_add_input").val();
                var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
                if(!regName.test(empName)){
                    //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                    show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
                    return false;
                }else{
                    show_validate_msg("#empName_add_input", "success", "");
                };
                
                //发送ajax请求校验用户名是否可用
                var empName = this.value;
                $.ajax({
                    url:"${APP_PATH}/checkuser",
                    data:"empName="+empName,
                    type:"POST",
                    success:function(result){
                        console.log(result);
                        if(result.code==100){
                            show_validate_msg("#empName_add_input","success","用户名可用");
                            $("#emp_save_btn").attr("ajax-va","success");
                        }else{
                            console.log("显示失败这里");
                            show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                            $("#emp_save_btn").attr("ajax-va","error");
                        }
                    }
                });

            })
            
            $("#email_add_input").change(function () {
                var email = $("#email_add_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if(!regEmail.test(email)){
                    //alert("邮箱格式不正确");
                    //应该清空这个元素之前的样式
                    show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
                    /* $("#email_add_input").parent().addClass("has-error");
                    $("#email_add_input").next("span").text("邮箱格式不正确"); */
                    return false;
                }else{
                    show_validate_msg("#email_add_input", "success", "");
                }
                return true;
            })

            //校验表单数据
            function validate_add_form(){
                //1、拿到要校验的数据，使用正则表达式
                var empName = $("#empName_add_input").val();
                var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
                if(!regName.test(empName)){
                    //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                    show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
                    return false;
                }else{
                    show_validate_msg("#empName_add_input", "success", "");
                };

                //2、校验邮箱信息
                var email = $("#email_add_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if(!regEmail.test(email)){
                    //alert("邮箱格式不正确");
                    //应该清空这个元素之前的样式
                    show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
                    /* $("#email_add_input").parent().addClass("has-error");
                    $("#email_add_input").next("span").text("邮箱格式不正确"); */
                    return false;
                }else{
                    show_validate_msg("#email_add_input", "success", "");
                }
                return true;
            }

            //显示校验结果的提示信息
            function show_validate_msg(ele,status,msg){
                //清除当前元素的校验状态
                $(ele).parent().removeClass("has-success has-error");
                $(ele).next("span").text("");
                if("success"==status){
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text(msg);
                }else if("error" == status){
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg);
                }
            }

            
            $("#emp_save_btn").click(function () {
                //1、模态框中填写的表单数据提交给服务器进行保存
                //1、先对要提交给服务器的数据进行校验
                if(!validate_add_form()){
                    return false;
                };


                //1、判断之前的ajax用户名校验是否成功。如果成功。

                if($(this).attr("ajax-va")=="error"){
                    return false;
                }

                //2、发送ajax请求保存员工
                $.ajax({
                    url:"${APP_PATH}/emp",
                    type:"POST",
                    data:$("#empAddModal form").serialize(),
                    success:function (result) {
                        if(result.code==100){
                            //员工保存成功；
                            //1、关闭模态框
                            $("#empAddModal").modal('hide');
                            //2、来到最后一页，显示刚才保存的数据
                            //发送ajax请求显示最后一页数据即可
                            to_page(totalPage);
                        }else{

                            //显示失败信息
                            //有哪个字段的错误信息就显示哪个字段的；
                            // if(undefined != result.extend.errorFields.email){
                            //     //显示邮箱错误信息
                            //     show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                            // }
                            // if(undefined != result.extend.errorFields.empName){
                            //     //显示员工名字的错误信息
                            //     show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                            // }
                        }
                    }
                })
               // console.log($("#empAddModal form").serialize());

            })
            
            function resetForm(ele){
                $(ele)[0].reset();
                $(ele).find("*").removeClass("has-error has-success");
                $(ele).find(".help-block").text("");
            }


            $("#addnewEmpBtn").click(function () {

                //清空表单样式
                resetForm("#empAddModal form");


                //发送ajax请求，查出部门信息，显示在下拉列表中
                getDept("#empAddModal select");


                $('#empAddModal').modal({
                    backdrop:"static"
                });
            });

            function getDept(ele) {
                $(ele).empty();
                $.ajax({
                    url:"${APP_PATH}/depts",
                    type:"GET",
                    success:function(result){
                        $.each(result.extend.depts,function(index,item){
                            //console.log(result.extend.depts)

                             var optionEle = $("<option></option>").append(this.deptname).attr("value",this.id);
                             optionEle.appendTo(ele);
                        })
                    }
                })
            }


            function to_page(pn,empName) {
                // if(empName!=null){
                //     console.log("xxx");
                // }
                $.ajax({
                    url:"${APP_PATH}/emps",
                    data:{'pn':pn,'empName':empName},
                    type:"GET",
                    success:function(result){
                        console.log(result);

                        //解析并显示人工信息
                        build_emp_tables(result);

                        //解析并显示分页信息
                        build_page_info(result);

                        //解析显示分页条信息
                        build_page_nav(result);
                    }
                })
            }

            function build_page_nav(result){
                $("#page_nav_area").empty();
                var ul = $("<ul></ul>").addClass("pagination");

                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
                var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
                if(result.extend.pageInfo.hasPreviousPage == false){
                    firstPageLi.addClass("disabled");
                    prePageLi.addClass("disabled");
                }else{
                    firstPageLi.click(function () {
                        to_page(1,empName);
                    });
                    prePageLi.click(function(){
                        to_page(result.extend.pageInfo.pageNum -1,empName);
                    });
                }

                var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
                var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
                if(result.extend.pageInfo.hasNextPage == false){
                    nextPageLi.addClass("disabled");
                    lastPageLi.addClass("disabled");
                }else{
                    nextPageLi.click(function(){
                        to_page(result.extend.pageInfo.pageNum +1,empName);
                    });
                    lastPageLi.click(function(){
                        to_page(result.extend.pageInfo.pages,empName);
                    });
                }



                //添加首页和前一页 的提示
                ul.append(firstPageLi).append(prePageLi);


                $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

                    var numLi = $("<li></li>").append($("<a></a>").append(item));
                    if(result.extend.pageInfo.pageNum == item){
                        numLi.addClass("active");
                    }
                    numLi.click(function(){
                        to_page(item,empName);
                    });
                    ul.append(numLi);
                });

                ul.append(nextPageLi).append(lastPageLi);

                //把ul加入到nav
                var navEle = $("<nav></nav>").append(ul);
                navEle.appendTo("#page_nav_area");
            }



            function build_page_info (result) {

                totalRecord = result.extend.pageInfo.total;
                currentPage = result.extend.pageInfo.pageNum;
                totalPage = result.extend.pageInfo.pages;

                $("#page_info_area").empty();
                $("#page_info_area").append("当前"+currentPage+
                    "页，总共"+result.extend.pageInfo.pages+"页，总共"
                    +totalRecord+"条记录");
            }


            // dId: 2
            // department: {id: 2, deptname: "开发部", iocadd: null}
            // email: "Shenbomaster@163.com"
            // empId: 1
            // empName: "Shen"
            // gender: "M"
            function build_emp_tables(result){
                $("#emps_table tbody").empty();
                var empList = result.extend.pageInfo.list;
                //console.log(empList);
                $.each(empList,function(index,item){
                    var checkBoxId = $("<td><input type='checkbox' class='check_item'/></td>");
                    var empIdTd = $("<td></td>").append(item.empId);
                    var empNameTd = $("<td></td>").append(item.empName);
                    var empEmailTd = $("<td></td>").append(item.email);
                    var empGenderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
                    var departmentTd = $("<td></td>").append(item.department.deptname);


                    var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                        .append($("<span></span>")).addClass("glyphicon glyphicon-pencil")
                        .append("编辑");

                    editBtn.attr("edit-id",item.empId);

                    var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                    //为删除按钮添加一个自定义的属性来表示当前删除的员工id
                    delBtn.attr("del-id",item.empId);

                    var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

                    $("<tr></tr>").append(checkBoxId)
                        .append(empIdTd)
                        .append(empNameTd)
                        .append(empGenderTd)
                        .append(empEmailTd)
                        .append(departmentTd)
                        .append(btnTd)
                        .appendTo("#emps_table tbody");
                });

            }

            $(document).on("click",".edit_btn",function () {
                // alert("edit");

                //查出员工信息 显示员工信息

                $.ajax({
                    url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
                    type:"GET",
                    success:function (result) {
                       console.log(result)
                        var empInfo = result.extend.emp;

                        $("#empName_update_static").text(empInfo.empName);
                        $("#email_update_input").val(empInfo.email);
                        $("#empUpdateModal input[name='gender']").val([empInfo.gender]);
                        $("#empUpdateModal select").val([empInfo.dId]);
                    }
                });


                //查出部门信息  并显示部门列表
                getDept("#empUpdateModal select");

                $("#emp_update_btn").attr("edit_id",$(this).attr("edit-id"));


                $('#empUpdateModal').modal({
                    backdrop:"static"
                });
            });

            $(document).on("click",".delete_btn",function(){
                var empName = $(this).parents("tr").find("td:eq(2)").text();
                var empId = $(this).attr("del-id");
                if(confirm("确认删除: "+empName+" 么？")){
                    $.ajax({
                        url:"${APP_PATH}/emp/"+empId,
                        type:"DELETE",
                        success:function(result){
                            alert(result.msg);
                            to_page(currentPage,empName);
                        }
                    })
                }
            });

            //更新按钮
            $("#emp_update_btn").click(function(){
                var email = $("#email_update_input").val();
                if(!validatorEmail(email)){
                    show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
                    return false;
                }else{
                    show_validate_msg("#email_update_input", "success", "");
                }

                console.log(1);


                // POST   _method
                $.ajax({
                    url:"${APP_PATH}/emp/"+$(this).attr("edit_id"),
                    type:"PUT",
                    data:$("#empUpdateModal form").serialize(),
                    success:function (result) {
                       // alert(result.msg);
                        //关闭对话框
                        $("#empUpdateModal").modal("hide");
                        //回到修改页面
                        to_page(currentPage,empName);
                    }

                })


            });

            $("#check_all").click(function(){
                $(".check_item").prop("checked",$(this).prop("checked"));
            });

            $(document).on("click",".check_item",function(){
                var flag = $(".check_item:checked").length == $(".check_item").length;
                $("#check_all").prop("checked",flag);
            })

            $("#emp_delete_all_btn").click(function () {

                var empNames = "";
                var del_ids = "";
                $.each($(".check_item:checked"),function () {
                    empNames += $(this).parents("tr").find("td:eq(2)").text()+',';
                    del_ids  += $(this).parents("tr").find("td:eq(1)").text()+'-';
                })

                empNames = empNames.substring(0,empNames.length-1);
                del_ids = del_ids.substring(0,del_ids.length-1);

                if(confirm("确认删除【"+empNames+"】吗？")){
                    //发送ajax请求删除
                    $.ajax({
                        url:"${APP_PATH}/emp/"+del_ids,
                        type:"DELETE",
                        success:function(result){
                            alert(result.msg);
                            //回到当前页面
                            to_page(currentPage,empName);

                            $("#check_all").prop("checked",false);
                        }
                    });
                }


            });


            $("#search_emp_btn").click(function(){
                var empNameToSearch = $("#searchInput").val();
                empName = empNameToSearch;
                to_page(1,empName);

            });


            /*
             * 验证邮箱格式是否正确
             */
            function validatorEmail(value){
                // 正则验证格式
                eval("var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;");
                return RegExp(reg).test(value);
            }


        </script>
</body>
</html>
