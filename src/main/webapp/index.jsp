<%--
  Created by IntelliJ IDEA.
  User: YQF
  Date: 2019/9/22
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>

    <%--    web路径：
            不以/开始的相对路径，找资源，以当前资源的路径为基准，容易出问题
            以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:8080),需要加上项目路径--%>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--引入JQuery--%>
    <script src="${APP_PATH}/static/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/fonts/*">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .p{
           cursor: pointer;
        }
    </style>
</head>
<body>
<%--员工修改的模态框--%>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_update_input" placeholder="请输入员工邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <%--部门提交部门Id即可--%>
                            <select name="dId" class="form-control" id="dept_update_select">

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

<%--员工添加的模态框--%>
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="请输入员工姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_add_input" placeholder="请输入员工邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dept_add_select" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <%--部门提交部门Id即可--%>
                            <select name="dId" class="form-control" id="dept_add_select">

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



<%--搭建显示页面--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12"></div>
        <h1>SSM-CRUD</h1>
    </div>
    <%--按钮--%>
    <div class="row btn-sm" style="padding-left: 220px">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
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
    <%--显示分页数据--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>
        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>

<script type="text/javascript">

    window.onload=function(){
        var totalRecord,currentPage;
        //1.页面加载完成以后，直接去发送一个ajax请求，要到分页数据
        $(function () {
            //去首页
            to_page(1);
        });
        
        function to_page(pn) {
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn="+pn,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    //1.解析并显示员工数据
                    build_emps_table(result);
                    //2.解析显示分页信息
                    build_page_info(result);
                    //3.解析显示分页条数据
                    build_page_nav(result);
                }
            });
        }

        //解析显示表格数据
        function build_emps_table(result) {
            //清空table表格
            $("#emps_table tbody").empty();

            var emps = result.extend.pageInfo.list;
            $.each(emps,function (index,item) {
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);

                /**
                 <button class="btn btn-primary btn-sm">
                 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                 编辑
                 </button>
                 */

                var editBtn = $("<button></button>").addClass("btn btn_primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前员工的id
                editBtn.attr("edit-id",item.empId);

                var delBtn = $("<button></button>").addClass("btn btn_danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //为删除按钮添加一个自定义的属性来表示当前删除的员工id
                delBtn.attr("del-id",item.empId);

                var btnTd = $("<td></td>").append(editBtn).append("    ").append("  ").append(delBtn);

                //append方法执行完成以后还是返回原来的元素
                $("<tr></tr>").append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd).append(btnTd).appendTo("#emps_table tbody");
            });
        }

        //解析显示分页信息
        function build_page_info(result) {
            //清空分页信息
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总共"+result.extend.pageInfo.pages+"页,共条"+result.extend.pageInfo.total+"记录");
            totalRecord = result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;
        }

        //解析显示分页条
        function build_page_nav(result) {
            //清空分页条信息
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");

            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").addClass("p").append($("<a></a>").append("&laquo;"));
            if(result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else {
                //为元素添加点击翻页的事件
                firstPageLi.click(function () {
                    to_page(1);
                });
                prePageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum-1);
                });
            }

            //添加首页和上一页
            ul.append(firstPageLi).append(prePageLi);
            //遍历取出页面编号  1,2,3,4,5
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").addClass("p").append($("<a></a>").append(item));
                if(result.extend.pageInfo.pageNum==item){
                    numLi.addClass("active");
                }
                //单击事件，去到item页
                numLi.click(function () {
                    to_page(item);
                });

                //添加页面号
                ul.append(numLi);
            });

            var nextPageLi = $("<li></li>").addClass("p").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(result.extend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                //为元素添加点击翻页的事件
                nextPageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum+1);
                });
                lastPageLi.click(function () {
                    to_page(result.extend.pageInfo.pages);
                });
            }

            //添加下一页和末页
            ul.append(nextPageLi).append(lastPageLi);
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }

        //清空表单样式及内容
        function reset_form(ele) {
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }

        //点击新增按钮弹出模态框
        $("#emp_add_modal_btn").click(function () {
            //清除表单数据(表单重置)
            reset_form("#empAddModal form");
            //发送Ajax请求，查出部门信息，显示在下拉列表中
//            $("#dept_add_select").empty();
            getDepts("#empAddModal select");
            $("#empAddModal").modal({
                backdrop:"static"
            });
        });

        //查出所有的部门信息并显示在下拉列表中
        function getDepts(ele) {
            //清空之前下拉列表的值
            $(ele).empty();
            $.ajax({
               url:"${APP_PATH}/depts",
               type:"GET",
               success:function (result) {
                   //console.log(result);
                   //extend: {depts: [{deptId: 1, deptName: "开发部"}, {deptId: 2, deptName: "测试部"}]}
                   //显示部门信息到下拉列表中
                   $.each(result.extend.depts,function () {
                      var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                      optionEle.appendTo(ele);
                   });
               }
            });
        }

        //校验表单数据
        function validate_add_form() {
            //1.拿到表单中的数据，使用正则表达式进行校验
            //1.1校验用户名
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if(!regName.test(empName)){
                show_validate_msg("#empName_add_input","error","用户名格式必须是2-5位中文或者6-16位英文和数字的组合");
                return false;
            }else{
                show_validate_msg("#empName_add_input","success","");
            }
            //1.2校验邮箱信息
            var email = $("#email_add_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#email_add_input","error","邮箱格式错误");
                return false;
            }else{
                show_validate_msg("#email_add_input","success","");
            }
            return true;
        }

        //显示校验结果的提示信息
        function show_validate_msg(ele,status,msg) {
            //清除当前元素的样式
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");

            if ("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error"==status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        //校验用户名是否可用
        $("#empName_add_input").change(function () {
            //发送ajax请求校验用户名是否可用
            var empName = this.value;
            $.ajax({
                url:"${APP_PATH}/checkuser",
                data:"empName="+empName,
                type:"POST",
                success:function (result) {
                    if(result.code==100){
                        show_validate_msg("#empName_add_input","success","用户名可用");
                        $("#emp_save_btn").attr("ajax-va","success");
                    }else{
                        show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                        $("#emp_save_btn").attr("ajax-va","error");
                    }
                }
            });
        });


        //为保存按钮添加单击事件,保存员工
        $("#emp_save_btn").click(function () {
            //模态框中填写的表单数据保存到数据库中

            //1.先对要提交给服务器的数据进行校验
            if(!validate_add_form()){
                return false;
            }
            //判断之前的ajax用户名校验是否成功
            if($(this).attr("ajax-va")=="error"){
                return false;
            }

            //2.发送ajax请求保存员工
            $.ajax({
                url:"${APP_PATH}/emp",
                type:"POST",
                data:$("#empAddModal form").serialize(),
                success:function (result) {
                    if (result.code==100){
                        //员工保存成功
                        //1.关闭模态框
                        $("#empAddModal").modal('hide');
                        //2.来到最后一页，显示刚才保存的数据
                        //发送ajax请求显示最后一页数据
                        to_page(totalRecord);
                    }else {
                        //显示失败信息
                        //console.log(result);
                        //有那个字段的错误信息就显示那个字段
                        if(undefined != result.extend.errorFields.email){
                            //显示邮箱的错误信息
                            show_validate_msg("#email_add_input","error",result.extend.errorFields.email);

                        }
                        if(undefined!= result.extend.errorFields.empName){
                            //显示员工的错误信息
                            show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName)
                        }

                    }
                }
            });
        });



        //1.可用在创建按钮的时候绑定  2.绑定点击.live()
        //jquery新版没有live，使用on进行替代
        $(document).on("click",".edit_btn",function () {

            //2.查出部门信息，显示部门信息
            getDepts("#empUpdateModal select");
            //1.查出员工信息，显示员工信息
            getEmp($(this).attr("edit-id"));

            //3.把员工的id传递给模态框的更新按钮
            $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
            $("#empUpdateModal").modal({
                backdrop:"static"
            });
        });

        function getEmp(id) {
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    var empData = result.extend.emp;
                    $("#empName_update_static").text(empData.empName);
                    $("#email_update_input").val(empData.email);
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#empUpdateModal select").val([empData.dId]);
                }
            });
        }

        //点击更新，更新员工信息
        $("#emp_update_btn").click(function () {
            //1.2校验邮箱信息
            var email = $("#email_update_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#email_update_input","error","邮箱格式错误");
                return false;
            }else{
                show_validate_msg("#email_update_input","success","");
            }

            //2.发送Ajax请求，更新员工
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
                type:"PUT",
                data:$("#empUpdateModal form").serialize(),
                success:function (result) {
                    //alert(result.msg);
                    //1.关闭对话框
                    $("#empUpdateModal").modal("hide");
                    //2.回到本页面
                    to_page(currentPage);
                }
            });
        });

        //单个删除
        $(document).on("click",".delete_btn",function () {
            //1.弹出是否确认删除对话框
            var empName = $(this).parents("tr").find("td:eq(1)").text();
            var empId = $(this).attr("del-id");
            if(confirm("确认删除【"+empName+"】吗？")){
                //确认，发送ajax请求删除即可
                $.ajax({
                    url:"${APP_PATH}/emp/"+empId,
                    type:"DELETE",
                    success:function (result) {
//                        alert(result.msg);
                        //回到本页
                        to_page(currentPage);
                    }
                });
            }

        });


    }


</script>

</body>
</html>

