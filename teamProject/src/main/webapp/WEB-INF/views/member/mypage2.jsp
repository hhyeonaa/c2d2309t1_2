<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/member/mypage.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel= "stylesheet" href= "https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
body{
	font-family: 'Saira Semi Condensed', sans-serif; 
}
.tick{
	position: relative;
	top: 0.5vh;
}
.main{
	height: auto;
	width: 35vw;
	background-color: white;
	margin: auto;
	position: relative;
	top: 15vh;
	padding: 3vh;
}
.picture img{
	height: 8vw;
	width: 8vw;
	position: relative;
	top: 1vw;
}
.add{
	background-color: #43a047;
	position: relative;
	top: 3vw;
	right: 2vw;
}
.name{
	font-size: 20px;
}
.details p{
	position: relative;
	top: 1vw;
}
.name i{
	color: blue;
}
td{
	text-align: center;
}
tr{
	border: 2px solid white;
}
.table{
	margin-top: 2vw;
	
}
.edit{
	background-color: #43a047;
	width: 90%;
	color:#fff !important;
}

@media only screen and (max-width: 425px){
	.main{
		width: 100vw;
		height: auto;
	}
	.picture img{
		height: 40vw;
		width: 40vw;
		position: relative;
		left: 5vw;
	}
	.details p{
		position: relative;
		top: 5vw;
	}
	.add{
		position: relative;
		top: 8vw;
	}
}
@media only screen and (max-height: 725px){
	.main{
		height:auto;
	}
}
</style>
</head>

<body>
<div class = "z-depth-5 main">
<div class = "row">
<div class = "col-sm-6 picture">
<center><img class="circle responsive-img" src="https://data.mothership.tools/mothershiptools-ukprod/wp-content/uploads/2019/01/PressShot.jpg"><span><a class="btn-floating pulse waves-effect waves-light add"><i class="material-icons">add</i></a></span></center>
</div>
<div class = "col-sm-6 details">
<center><p class="name"><b>Mark Ronson</b> <i class = "material-icons tick">check_circle</i></p></center>
<center><p>Musician, Songwriter</p></center>
<center><p>FIND U AGAIN out now!</p></center>
</div>
</div>

<table class = "table">
<tr>
<td>
<p><b>1,236</b></p>
<p>Posts</p>
</td>
<td>
<p><b>767K</b></p>
<p>Followers</p>
</td>
<td>
<p><b>892</b></p>
<p>Following</p>
</td>
</tr>
</table>

<center><a class="waves-effect waves-light btn edit">Edit Profile</a></center>

</div>
</body>
</html>