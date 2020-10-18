<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>教师信息</title>
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
            <th>教师ID</th>
            <th>教师姓名</th>
            <th>教师密码</th>
            <th>修改</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${teaList}" var="teacher">
            <tr>
                <td>${teacher.teaId}</td>
                <td>${teacher.teaName}</td>
                <td>${teacher.teaPass}</td>
                <td>
                    <button class="layui-btn" onclick="delete_fun(${teacher.teaId})">修改
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <script>
        function delete_fun(classId) {

                window.location.href = "<%=basePath%>admin/editTeacher?teaid=" + classId;

        }
    </script>
</rapid:override>
<%@ include file="base.jsp" %>
