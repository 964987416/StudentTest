<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>学生界面</title>
<link rel="icon" type="image/x-icon" href="images/tubiao.jpg" />
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/distpicker.js"></script>
<script>
$(document).ready(function(){
	  $("#download").click(function(){
		  var filename =  prompt("请输入你想要下载的文件","test-王大锤.txt");
		  window.location.href="download?filename="+filename;
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
		<b id="title">作业上传：</b> 
		<hr/>	
		 <form action="gotoAction" enctype="multipart/form-data" method="post">
        <table>
            <tr>
                <td><b>请选择作业：</b></td>
                <td><input type="file" name="file"></td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td><b>开始上传</b></td>
                <td><input type="submit" value="上传"></td>
            </tr>
        </table>
    </form>
	 
	<table border="0" align="left" >
		<tr>
		<th><img id="download" src="images/download.png" border="0" width="50" height="50"><th> 
		</tr>
		<tr>
		<td><span style="color: blue">下载作业</span></td>
		</tr>
	</table>

</body>
</html>
