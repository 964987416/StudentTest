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
<title>分数查询界面</title>
<link rel="icon" type="image/x-icon" href="images/tubiao.jpg" />

<script src="js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	  $("#beginExam").click(function(){
		  var coursename =  prompt("请输入你想要查询的课程","语文");
		  var classesname =  prompt("请输入你想要查询的班级","工商管理一班");
		  window.location.href="teacherSelectPoint?classesname="+classesname+"&coursename="+coursename;
		  alert("查询中,请稍后。。。。");
	  });
	  
	  $("#classes").click(function(){
		  var coursename =  prompt("请输入你想要查询的课程","语文");
		  var classesname =  prompt("请输入你想要查询的班级","工商管理一班");
		  var stuname = prompt("请输入你想要查询的学生姓名","王大锤");
		  window.location.href="teacherSelectPointone?classesname="+classesname+"&coursename="+coursename+"&stuname="+stuname;
		  alert("查询中,请稍后。。。。");
	  });
	  
	  
	  $("#add").click(function(){
		  var coursename =  prompt("请输入手动录入成绩的课程","语文");
		  var classesname =  prompt("请输入手动录入成绩的班级","工商管理一班");
		  var stuname = prompt("请输入学生姓名","王大锤");
		  var grade = prompt("请输入成绩","100");
		  alert("添加成功！");
		  window.location.href="addGrade?classesname="+classesname+"&coursename="+coursename+"&stuname="+stuname+"&grade="+grade;
		  });
	  
	  $("#upload").click(function(){
		  window.location.href="http://127.0.0.1:9090/StudentTest/upload.jsp";
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
		<b id="title">成绩统计及作业上传：</b>  
		<hr/>	
		<table border="0" align="center" > 
		<tr>
		<th><img id="beginExam" src="images/select.png" border="0" width="50" height="50"><th>
		<th><img id="classes" src="images/select1.png" border="0" width="50" height="50"><th> 
		</tr>
		<tr>
		<td><span style="color: blue">按班级课程查询分数</span></td>
		<td></td>
		<td><span style="color: blue">查询个人期末成绩</span></td>
		</tr>
		</table>
		
		<form method="get" action="addWork">
	<!-- 图标 -->
	<ul style="float:right ">
     <!--<li id = "search" ><span><img src="images/select.png" border="0" width="50" height="50"></span></li>-->	
	<li id = "add"><span><img src="images/add.png" border="0" width="50" height="50"></span></li>
	<li id = "upload"><span><img src="images/upload.png" border="0" width="50" height="50"></span></li>
	</ul>
	
		<table width="75%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#000000"
			style="border-collapse: collapse" >
			<tr>
				<td><b style="color: red" >学生姓名</b></td>
				<td><b style="color: red" >班级名称</b></td>
				<td><b style="color: red" >课程名称</b></td>
				<td><b style="color: red" >分数</b></td>
				<td><b style="color: red" >任课教师</b></td>
				<td><b style="color: red" >作业时间</b></td>
				
			</tr>
			<c:forEach items="${questionList}" var="question">
			<tr>
				<td><input name ="id" value="${question.stuname}" type="hidden"/>${question.stuname}</td>
				<td><input name ="id" value="${question.classesname}" type="hidden"/>${question.classesname}</td>
				<td><input name ="id" value="${question.coursename}" type="hidden"/>${question.coursename}</td>
				<td><input name ="id" value="${question.grade}" type="hidden"/>${question.grade}</td>
				<td><input name ="id" value="${question.teachername}" type="hidden"/>${question.teachername}</td>
				<td><input name ="id" value="${question.time}" type="hidden"/>${question.time}</td>
				
			</c:forEach> 
		</table>
	
	
	</form>
	

</body>
</html>
