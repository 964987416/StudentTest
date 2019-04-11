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
<title>答题界面</title>
<link rel="icon" type="image/x-icon" href="images/tubiao.jpg" />

<script src="js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	  $("#beginExam").click(function(){
		  var name = prompt("请输入科目名称","语文");
		  var username = prompt("请输入所在班级","软件工程");
		  window.location.href="beginExam?name="+name+"&username="+username;
		  alert("开启题库成功,请稍后。。。。");
	  });
	  
	  $("#answer").click(function(){
		 
		  alert("提交成功！");
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
<b id="title">答题界面：</b> 
		<hr/>		
		<table border="0" align="center" >
		<tr>
		<th><img id="beginExam" src="images/begin.png" border="0" width="50" height="50"><th>
		</tr>
		<tr>
		<td><span style="color: blue">开始答题</span></td>
		</tr>
		</table>
				
		<form method="post" action="workCommit">
		<table width="75%" border="1" align="center" cellpadding="6"
			cellspacing="1" bordercolor="#000000"
			style="border-collapse: collapse" >
			<tr>
				<td></td>
				<td><b style="color: red" >未完成答题请勿提交！！</b></td>
				</tr>
			<tr>
				<td><b style="color: red" >姓名</b></td>
				<td><input  name = "name" style="color: red" ></input></td>
				</tr>
			<c:forEach items="${questionList}" var="question">
			<tr>
				<th>id：</th>
				<td><input name ="id" value="${question.id}" type="hidden"/>${question.id}</td>
			</tr>
			<tr>
				<th>题目：</th>
				<td>${question.question}</td>
			</tr>
			<tr> 
				<td>答题区：</td>
				<td><textarea name="answer" cols="150" rows="20" id="beizhu"></textarea></td>
			</tr>
			</c:forEach> 
			<tr>
				<td>&nbsp;</td>
				<td><input id ="commit" type="submit" value="提交" />  <input type="reset"
					value="重置" /></td>
			</tr>
			
		</table>
		</form>

</body>
</html>
