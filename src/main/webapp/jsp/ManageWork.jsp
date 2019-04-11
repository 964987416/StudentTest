<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>教师作业管理界面</title>
<link rel="icon" type="image/x-icon" href="images/tubiao.jpg" />

<script src="js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	  $("#search").click(function(){
		  var classesname =  prompt("请输入你想要查询的班级名称","软金一班");
		  var name =  prompt("请输入您的姓名","王大锤");
		  var time = prompt("请输入作业布置的时间","2019-03-25");
		  
		  window.location.href="selectWork?classesname="+classesname+"&name="+name+"&time="+time;
		  alert("查询中,请稍后。。。。");
	  });
	  
	  $("#commit").click(function(){
		  alert("添加成功！");
	  });
	  $("#delete").click(function() {
			var id = prompt("请输入你要删除的作业id", "6");

			window.location.href = "deleteWork?id="+id;
			alert("删除成功！");

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
	<div id="head"></div>
		<table border="0">
			<tr>
				<th scope="col"><a href="../StudentTest/jsp/teacherindex.jsp"><img src="images/index.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/jsp/ManageWork.jsp"><img
						src="images/exam.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/jsp/JuggWork.jsp"><img
						src="images/chengji.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/jsp/CommitPointAndUploadWork.jsp"><img
						src="images/work.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/login.html"><img
						src="images/exit.png" border="0" width="50" height="50"></a></th>

			</tr>
			<tr>
				<td><span style="color: blue">信息首页</span></td>
				<td><span style="color: blue">作业管理</span></td>
				<td><span style="color: blue">批改作业</span></td>
				<td><span style="color: blue">成绩统计</span></td>
				<td><span style="color: blue">退出登录</span></td>
			</tr>
		</table>
		<b id="title">作业管理：</b> 
		<hr/>	
				
	<form method="get" action="addWork">
	<!-- 图标 -->
	<ul style="float:right ">
     <!--<li id = "search" ><span><img src="images/select.png" border="0" width="50" height="50"></span></li>-->	
	<li id = "search"><span><img src="images/select.png" border="0" width="50" height="50"></span></li>
	<li id = "add"><span><img src="images/add.png" border="0" width="50" height="50"></span></li>
	<li id = "delete"><span><img src="images/delete.png" border="0" width="50" height="50"></span></li>
	
	</ul>
	
		<br>
		<table width="75%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#000000"
			style="border-collapse: collapse">

			<tr>
				<td>作业科目：</td>
				<td><input id="name" name='CourseName' type='text' value='' /></td>
			</tr>
			<tr>
				<td>班级名称：</td>
				<td><input name='ClassesName' type='text' value='' /></td>
			</tr>
			<tr>
				<td>作业内容：</td>
				<td><textarea name="qusetion" cols="50" rows="8" ></textarea></td>
			</tr>
			<tr>
				<td>布置人：</td>
				<td><input id ="xuehao"name='teacherName' type='text' value='' /></td>
			</tr>
			<tr>
				<td>布置时间：</td>
				<td><input id ="xuehao"name='time' type='date' value='' /></td>
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
