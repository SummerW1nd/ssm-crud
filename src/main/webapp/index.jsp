<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2022/3/8
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
          th:href="@{/webjars/bootstrap/3.3.7/css/bootstrap.min.css}">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
            th:src="@{webjars/jquery/3.3.1/jquery.min.js}"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            th:src="@{/webjars/bootstrap/3.3.7/js/bootstrap.min.js}"></script>
</head>
<body>
<%--员工添加的模态框--%>
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@qq.com">
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
<%--                            部门提交部门id--%>
                            <select class="form-control" name="dId">
                                <option value=1>开发部</option>
                                <option value=2>测试部</option>
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
    <%--    标题--%>
    <div class="row"></div>
    <div class="col-md-12">
        <h1>SSM-CRUD</h1>
    </div>
    <%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_model_btn">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--    表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_tables">
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
    <%--    页表--%>
    <div class="row">
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn="+pn,
            type: "GET",
            success: function (result) {
                // console.log(result);
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);

            }
        });

    }

    function build_emps_table(result) {

        $("#emps_tables tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            // alert(item.empName);
            var empIdTd=$("<td></td>").append(item.empId);
            var empNameTd=$("<td></td>").append(item.empName);
            var genderTd=$("<td></td>").append(item.gender=='M'?'男':'女');
            var emailTd=$("<td></td>").append(item.email);
            var deptNameTd=$("<td></td>").append(item.department.deptName);
            var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            var btnTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_tables tbody");
        })
    };

    
    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"
            +result.extend.pageInfo.pageNum+"页,总"
            +result.extend.pageInfo.pages+" 页,总"+
            result.extend.pageInfo.total+"条记录")
    }
    //解析显示分页条
    function build_page_nav(result) {

        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        //构建元素
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }
        //为元素添加点击的翻页事件
        firstPageLi.click(function () {
            to_page(1);
        })
        prePageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum-1);
        })

        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));

        nextPageLi.click(function () {
            to_page(result.extend.pageInfo.pageNum+1);
        })
        lastPageLi.click(function () {
            to_page(result.extend.pageInfo.pages);
        })

        if(result.extend.pageInfo.hasPreviousPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }
        ul.append(firstPageLi).append(prePageLi);

        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum==item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            })
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var  navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");

    };

    //点击新增按钮弹出模态框
    $("#emp_add_model_btn").click(function () {
        $("#empAddModal").modal({
            backdrop:"static"
        });
    })

    //查出所有部门信息显示下拉列表
    function getDepts(){
        $.ajax({
            url:"${APP_PATH}/depts",
            type: "GET",
            success:function (result) {
                console.log(result);
<%--                ${"#dept_add_select"}.append("")--%>
//                 $.each(result.extend.depts,function () {
//                     var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
//                     optionEle.appendTo("#empAddModal select");
//                 })
            }
        })
    }

    $("#emp_save_btn").click(function () {
        //将模态框中填写的表单数据保存
        //发送ajax保存员工


        $.ajax({
            async:false,
            url:"${APP_PATH}/emp",
            type:"POST",
            data: $("#empAddModal form").serialize(),
            success:function (result) {
                alert(result.msg);
            }
        })

    })
</script>
</body>
</html>
