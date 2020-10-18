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
        <h1 style="text-align: center; margin-top: 25px; margin-bottom: 25px;">欢迎来到选课系统（学生版）</h1>
        <h2 style="text-align: center;margin-bottom: 20px">使用说明</h2>
        <h2 style="margin-left:50px; margin-bottom: 14px;">1.登陆后请及时修改初始密码（个人资料）</h2>
        <h2 style="margin-left:50px; margin-bottom: 14px;">2.在选课-课程信息中进行选课、查看、管理已选课程</h2>
        <h2 style="margin-left:50px; margin-bottom: 14px;">3.在选课-我的课程中可以查看成绩</h2>
    </div></div>
</rapid:override>
<%@ include file="base.jsp"%>