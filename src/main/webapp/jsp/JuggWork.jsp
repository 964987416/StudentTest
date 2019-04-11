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
<title>教师批改作业界面</title>
<link rel="icon" type="image/x-icon" href="images/tubiao.jpg" />
<script src="js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	  /* 个人查询 */
	  $("#person").click(function(){
		  var coursename =  prompt("请输入你想要课程名称","语文");
		  var stuname =  prompt("学生名称","王大锤");
		  var time =  prompt("请输入作业布置的时间","2019-03-25");

		  
		  window.location.href="juggWorkForPerson?coursename="+coursename+"&stuname="+stuname+"&time="+time;
		  alert("查询中,请稍后。。。。");
	  });
	  /* 班级查询 */
	  $("#classes").click(function(){
		  var coursename =  prompt("请输入你想要查询的课程名称","物理");
		  var classesname =  prompt("请输入你想要班级名称","机械制造一班");
		  var time =  prompt("请输入作业布置的时间","2019-03-27");
		  
		  window.location.href="juggWorkForclass?coursename="+coursename+"&classesname="+classesname+"&time="+time;
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
		<b id="title">批改作业：</b> 
		<hr/>	
		<table border="0" align="center" >
		<tr>
		<th><img id="person" src="images/select.png" border="0" width="50" height="50"><th>
		<th><img id="classes" src="images/select1.png" border="0" width="50" height="50"><th> 
		</tr>
		<tr>
		<td><span style="color: blue">批改个人作业</span></td>
		<td></td>
		<td><span style="color: blue">批改班级作业</span></td>
		</tr>
		
		
		</table>
				
		<form method="post" action="saveGrade">
		<table width="75%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#000000"
			style="border-collapse: collapse" >
			<tr>
				<td></td>
				<td><b style="color: red" >未完成批改 请勿提交！！</b></td>
				</tr>
			<c:forEach items="${questionList}" var="question">
			<tr>
				<th>id：</th>
				<td><input name ="id" value="${question.id}" type="hidden"/><b>${question.id}</b></td>
			</tr>
			<tr>
				<th>作业问题：</th>
				<td><b>${question.question}</b></td>
			</tr>
			<tr>
				<th>学生姓名：</th>
				<td><b style="color: red" >${question.stuname}</b></td>
			</tr>
			<tr>
				<th>所属班级：</th>
				<td><b style="color: red" >${question.classesname}</b></td>
			</tr>
			<tr>
				<th>回答：</th>
				<td><b>${question.answer}</b></td>
			</tr>
			<tr>
				<th>原始评语：</th>
				<td><b style="color: blue" >${question.note}</b></td>
			</tr>
			<tr> 
				<td>添加批改评语：</td>
				<td><textarea name="note" cols="120" rows="20" id="beizhu"></textarea></td>
			</tr>
			<tr> 
				<td>评分：</td>
				<td><input name="grade" type="number" ></input></td>
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
