<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>课程信息</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <p style="color:red; margin-top:10px; font-size:18px;">${msg}</p>
    <table class="layui-table" style="margin-top:15px;">
        <colgroup>
            <col width="100">
            <col width="120">
            <col width="80">
            <col width="50">
            <col width="50">
            <col width="60">
            <col width="60">
        </colgroup>
        <thead>
        <tr>
            <th>学生ID</th>
            <th>学生姓名</th>
            <th>学生密码</th>
            <th>学院名称</th>
            <th>修改</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${stuList}" var="student">
            <tr>
                <td>${student.stuId}</td>
                <td>${student.stuName}</td>
                <td>${student.stuPass}</td>
                <td>${student.insName}</td>
                <td>
                    <button class="layui-btn" onclick="delete_fun(${student.stuId})">修改
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <script>
        function delete_fun(classId) {

                window.location.href = "<%=basePath%>admin/editStudent?stuid=" + classId;

        }
    </script>
</rapid:override>
<%@ include file="base.jsp" %>
