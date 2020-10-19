<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>首页</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <div style="position: relative">
        <div style="width:800px; height:360px; margin:150px 200px; border:3px solid gray;border-radius: 20px
        ;background:url(/static/images/index-bg.jpg);filter: opacity(0.3);position: absolute"></div>
        <div style="width:800px; height:360px; margin:150px 200px; border:3px solid gray;border-radius: 20px; position: absolute">
            <h1 style="text-align: center; margin-top: 25px; margin-bottom: 25px;">欢迎来到选课系统（管理员版）</h1>
            <h2 style="text-align: center;margin-bottom: 20px">使用说明</h2>
            <h2 style="margin-left:50px; margin-bottom: 14px;">1.在教师管理中修改教师信息</h2>
            <h2 style="margin-left:50px; margin-bottom: 14px;">2.在学生管理中修改学生信息</h2>
            <h2 style="margin-left:50px; margin-bottom: 14px;">3.添加老师或学生</h2>
            <h2 style="margin-left:50px; margin-bottom: 14px;">4.添加管理员</h2>
            <h2 style="margin-left:50px; margin-bottom: 14px;">5.在管理员页面修改管理员信息</h2>
        </div></div>
</rapid:override>
<%@ include file="base.jsp"%>
