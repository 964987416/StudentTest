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
		  var classesname =  prompt("请输入你想要查询的科目名称","语文");
		  var name =  prompt("请输入姓名","王大锤");
		  
		  window.location.href="selectPoint?classesname="+classesname+"&name="+name;
		  alert("查询中,请稍后。。。。");
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
				<th scope="col"><a href="../StudentTest/jsp/studentindex.jsp"><img src="images/index.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/jsp/beginTest.jsp"><img
						src="images/exam.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/jsp/SelectPoint.jsp"><img
						src="images/chengji.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/jsp/SelectHomework.jsp"><img
						src="images/work.png" border="0" width="50" height="50"></a></th>
				<th scope="col"><a href="../StudentTest/login.html"><img
						src="images/exit.png" border="0" width="50" height="50"></a></th>
			</tr>
			<tr>
				<td><span style="color: blue">信息首页</span></td>
				<td><span style="color: blue">开始答题</span></td>
				<td><span style="color: blue">分数查询</span></td>
				<td><span style="color: blue">上传作业</span></td>
				<td><span style="color: blue">退出登录</span></td>
			</tr>
			
		</table>
		<b id="title">分数查询：</b> 
		<hr/>	
		<table border="0" align="center" >
		<tr>
		<th><img id="beginExam" src="images/select.png" border="0" width="50" height="50"><th>
		</tr>
		<tr>
		<td><span style="color: blue">查询分数</span></td>
		</tr>
		</table>
			
		<form method="post" action="workCommit">
		<table width="75%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#000000"
			style="border-collapse: collapse" >
			<tr>
				<td><b style="font-size: 20px;color: red" >☆☆☆</b></td>
				<td><b style="color: red" >仔细检查完教师反馈后,请订正作业</b></td>
				</tr>
			<c:forEach items="${questionList}" var="question">
			<tr>
				<th>问题id：</th>
				<td><input name ="id" value="${question.id}" type="hidden"/>${question.id}</td>
			</tr>
			<tr>
				<th>题目：</th>
				<td>${question.question}</td>
			</tr>
			<tr> 
				<th>回答：</th>
				<td><span style="color: blue">${question.answer}</span></td>
			</tr>
			<tr> 
				<th>你的分数：</th>
				<td><span style="color: red">${question.grade}</span></td>
			</tr>
			<tr> 
				<th>教师批改：</th>
				<td><span style="color: red">${question.note}</span></td>
			</tr>
			</c:forEach> 
			
		</table>
		</form>

</body>
</html>
