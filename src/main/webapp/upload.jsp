<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>文件上传与下载</title>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/distpicker.js"></script>
<script>
$(document).ready(function(){
	  $("#download").click(function(){
		  var filename =  prompt("请输入你想要下载的文件","test.txt");
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
    <form action="gotoActionTeacher" enctype="multipart/form-data" method="post">
        <table>
            <tr>
                <td><b>请选择文件：</b></td>
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
  	<ul style="float:left ">
	<li id = "download"><span><img src="static/images/download.png" border="0" width="50" height="50"></span></li>
	</ul>
	
</body>	 
</html>
