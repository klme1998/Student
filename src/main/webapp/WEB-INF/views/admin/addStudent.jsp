<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>添加学生信息</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <form class="layui-form" id="changeform" method="post" action="<%=basePath%>teacher/changeTeaPass" style="margin:80px 400px; width:450px;">
        <div class="layui-form-item">
            <label class="layui-form-label">学生Id</label>
            <div class="layui-input-block">
                <input value="" type="text" name="stuId" id="id"  placeholder="请输入学生Id" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">学生姓名</label>
            <div class="layui-input-block">
                <input value="" type="text" name="stuName" id="name" placeholder="请输入学生姓名" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">学生密码</label>
            <div class="layui-input-block">
                <input value="" type="text" name="stuPass" id="pass" placeholder="请输入学生密码" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">学院Id</label>
            <div class="layui-input-block">
                <input value="" type="text" name="insId" id="insId" placeholder="请输入学院Id" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">学院名称</label>
            <div class="layui-input-block">
                <input value="" type="text" name="insName" id="insName" placeholder="请输入学院名称" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
    <div class="layui-input-block" style="margin-left:500px;">
        <button type="button" onclick="history.back(-1);" class="layui-btn layui-btn-lg">
            返回上一页
        </button>
        <button type="button" id="success" class="layui-btn layui-btn-danger layui-btn-lg">
            确认提交
        </button>
    </div>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script>
        $(function () {
            $("#success").click(function () {
                var id = $("#id").val();
                var name = $("#name").val();
                var pass = $("#pass").val();
                var insId = $("#insId").val();
                var insName = $("#insName").val();
                var content=id+"|"+name+"|"+pass+"|"+insId+"|"+insName;
                var myform=document.createElement("form");
                myform.id = "form1";
                myform.name = "form1";
                document.body.appendChild(myform);
                var input = document.createElement("input");
                input.type = "text";
                input.name = "content";
                input.value = encodeURIComponent(encodeURIComponent(content));
                myform.appendChild(input);
                myform.method = "POST";
                myform.action = "<%=basePath%>admin/addStudentAction?page=1";
                myform.submit();
                document.body.removeChild(myform);
            })
        })
    </script>
</rapid:override>
<%@ include file="base.jsp" %>
