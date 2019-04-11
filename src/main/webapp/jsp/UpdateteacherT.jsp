<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>教师管理</title>
<link rel="icon" type="image/x-icon" href="images/tubiao.jpg" />
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/distpicker.js"></script>
<script>
$(document).ready(function(){
	  $("#delete").click(function(){
		  var code = prompt("请输入你想知道删除的教师编码",001);
		  window.location.href="deleteTeacher?code="+code;
		  alert("删除成功");
	  });
	  
	  $("#commit").click(function(){
		  alert("添加成功");
	  });
	});
</script>
<link rel="stylesheet" type="text/css" href="css/xueshengadd.css" />
<style type="text/css">
ul
{
list-style-type:none;
margin:0;
padding:0;
}
li
{
display:inline;
}

</style>
</head>
<body>
<div id="head" ></div>
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
<b id="title">教师管理：</b> 
		<hr/>
	<form method="post" action="addTeacher">
	<!-- 图标 -->
	<ul style="float:right ">
     <!--<li id = "search" ><span><img src="images/select.png" border="0" width="50" height="50"></span></li>-->	
	<li id = "add"><span><img src="images/add.png" border="0" width="50" height="50"></span></li>
	<li id = "delete"><span><img src="images/delete.png" border="0" width="50" height="50"></span></li>
	</ul>
		<br>
		<table width="75%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#000000"
			style="border-collapse: collapse">

			<tr>
				<td>教师姓名：</td>
				<td><input id="name" name='TeacherName' type='text' value='' /></td>
			</tr>
			<tr>
				<td>教师工号：</td>
				<td><input id ="code"name='code' type='text' value='' /></td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td><input name='Age' type='text' /></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><input name="Gender" type="radio" value="男" checked>
					男 <input type="radio" name="Gender" value="女"> 女</td>
			</tr>
			<tr>
				<td>所带课程：</td>
				<td><select name = "course">
 						 <option value ="001">语文</option>
 						 <option value ="002">数学</option>
 						 <option value="003">英语</option>
					</select>
				</td>
			</tr>
				<tr>
				<td>密码：</td>
				<td><input name='password' type='password' /></td>
			</tr>	
			<tr>
				<td>所带班级：</td>
				<td><input name='classname' type='text' /></td>
			</tr>				
			
			<tr>
				<td>&nbsp;</td>
				<td><input id ="commit" type="submit" value="提交" /> <input type="reset"
					value="重置" /></td>
			</tr>
		</table>
	</form>
	
	
	 
</body>
</html>
