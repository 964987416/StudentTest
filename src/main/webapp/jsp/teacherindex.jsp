<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>教师界面</title>
<link rel="icon" type="image/x-icon" href="images/tubiao.jpg" />
<script src="js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	  $("#updatePwd").click(function(){
		  var name = prompt("请输入你的姓名","赵铁柱");
		  var newpwd = prompt("请输入新密码","");
		  var newpwd1 = prompt("请确认您输入的新密码","");
		  if(newpwd==newpwd1){
		  	window.location.href="updatePwdT?name="+name+"&newpwd="+newpwd;
		  	alert("修改成功");
		  }else{
			alert("两次新密码不一致请重新输入！")
		  }
		  
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
<b id="title">密码修改：</b> 
		<hr/>
	<!-- 图标 -->
	<ul style="float:right ">
	<li id = "updatePwd"><span><img src="images/password.png" border="0" width="50" height="50"></span></li>
	</ul>

</body>
</html>
