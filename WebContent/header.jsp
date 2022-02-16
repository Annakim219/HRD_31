<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main page</title>
<style>
* {
	margin: 0;
	padding: 0
}

html,body{
	width: 100%;
	height: 100%;
}

header{
	width: 100%;
	height: 12%;
	line-height: 120px;
	text-align: center;
	background: lightgrey;
	color: black;
}

nav{
	width: 100%;
	height: 5%;
	line-height: 45px;
	text-align: left;
	background: black;
	color: white;
}

nav ul{
	display: inline-block;
	list-style-type: none;
}

nav li{
	float: left;
	margin: 0 25px;
}

nav a{
	display: block;
	text-decoration: none;
	color: white;
}

nav a:HOVER{
	color: white;
	font-weight: bold;
	font-size: 1.1em;
}

section{
	width: 100%;
	height: 78%;
}

section h2{
	text-align: center;
	margin: 20px auto;	
}

footer{
	width: 100%;
	height: 5%;
	line-height: 45px;
	text-align: center;
	background: grey;
	color: white;
	font-size: 0.9em;
}

table{
	margin: 0 auto;
	border-collapse: collapse;
	border: 2px solid grey;
}

tr,th,td{
	border: 1px solid grey;
}

#tr_btn{
	height: 50px;
}

#btn1{
	width: 120px;
	height: 30px;
	background: black;
	color: white;	
}

#btn2{
	width: 120px;
	height: 30px;
	background:grey;
	color: black;
	font-weight: bold;	
}

#p1 {
	margin-left: 5px;
	text-align: left;
}

#p2 {
	margin-right: 5px;
	text-align: right;
}

.btn_group{
	margin: 15px auto;
}

</style>
</head>
<body>
	<header>
		<h1>쇼핑몰 회원관리 ver1.0</h1>
	</header>
</body>
</html>