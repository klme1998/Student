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
    <div style="width:800px; height:360px; margin:150px 200px; border:3px solid gray; border-radius: 20px;
        background:url(/static/images/index-bg.jpg);filter: opacity(0.3);position: absolute"></div>
        <div style="width:800px; height:360px; margin:150px 200px; border:3px solid gray;border-radius: 20px; position: absolute">
        <h1 style="text-align: center; margin-top: 25px; margin-bottom: 25px;">欢迎来到选课系统（教师版）</h1>
        <h2 style="text-align: center;margin-bottom: 20px">使用说明</h2>
        <h2 style="margin-left:50px; margin-bottom: 14px;">1.登陆后请及时修改初始密码（个人资料）</h2>
        <h2 style="margin-left:50px; margin-bottom: 14px;">2.在我的课程信息中对已开设课程的查看、管理</h2>
        <h2 style="margin-left:50px; margin-bottom: 14px;">3.在我的课程信息课程管理中对已选课学生进行成绩录入</h2>
        <h2 style="margin-left:50px; margin-bottom: 14px;margin-right: 6px">4.通过我的课程信息-添加新课程添加课程，并设置课程详情</h2>
    </div></div>
</rapid:override>
<%@ include file="base.jsp"%>