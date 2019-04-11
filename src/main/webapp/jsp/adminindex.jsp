<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>管理员界面</title>

<link rel="stylesheet" type="text/css" href="css/xueshengadd.css" />
<style type="text/css">
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

li {
	display: inline;
}
</style>
</head>

<body>
	<div id="head"></div>
		<table border="0">
			<tr>
				<th scope="col"><a href="../StudentTest/jsp/adminindex.jsp"><img src="images/index.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/jsp/SelectstudentT.jsp"><img
						src="images/student.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/jsp/SelectcourseT.jsp"><img
						src="images/course.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/jsp/UpdateteacherT.jsp"><img
						src="images/teacher.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/login.html"><img
						src="images/exit.png" border="0" width="50" height="50"></a></th>

			</tr>
			<tr>
				<td><span style="color: blue">信息首页</span></td>
				<td><span style="color: blue">学生管理</span></td>
				<td><span style="color: blue">课程管理</span></td>
				<td><span style="color: blue">教师管理</span></td>
				<td><span style="color: blue">退出登录</span></td>
			</tr>
		</table>


</body>
</html>
