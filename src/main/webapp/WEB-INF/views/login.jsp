<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<link href="/css/theme.css" rel="stylesheet" type="text/css">

<style>

table {
    margin: 0 auto;
    border-collapse: colapse;
} 

table tr td {
    padding: 10px;
    font-family: 'YeongdeokSea';
}


input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddb48e;
    border-radius: 5px;
    box-sizing: border-box;
}
button{
 	  width: 100%;
}
</style>

<body>
<div id="container">
  <header id="herder">
   	<%@ include file="include/header.jsp" %>
  </header>

  <nav id="nav">
  	<%@ include file="include/nav.jsp" %>
  </nav>
  
  <main id="main">
    <div id="mainContent">   
     <h1><br>로그인</h1><br>  
        <hr> 
			<table id=tblLogin>
  		   <tr>
	          <td> Login ID </td>
	          <td><input id="loginId"></td> 
           </tr>
           <tr>
			  <td> Password </td>
			  <td><input type="password" id="password" ></td>
		    </tr>
		    <tr style="color: red; display: none;" id='error'>
		    	<td colspan="2">아이디 또는 비밀번호를 잘못 입력했습니다.<br>입력하신 내용을 다시 확인해주세요.</td>
		    </tr>
		    <tr>
			  	<td ></td> <!--비밀번호 찾기 부분-->
		    </tr>
		    <tr>
		      <td colspan="2"> <button id=btnLogin >로그인</button></td>
		  	</tr>
		    <tr>
		      <td colspan="2"> <button id=btnSignup >회원가입</button>
		    </tr>
		  </table>
    </div>
  </main>
  
  <footer id="footer">
  	<%@ include file="include/footer.jsp" %>
  </footer>
</div>
</body>

<script src='http://code.jquery.com/jquery-latest.js'></script>
<script>
$(document)
.ready(function(){
	$('#loginId').focus();
})
.on('click','#btnLogin',function(){
  $.ajax({
		type:'Post',
		url:'/dologin' ,
		data:{loginId:$('#loginId').val(),passwd:$('#password').val()},
		dataType:'text',
		success:function(data){
			if(data=='1'){
				$('#loginId,#password').val('');
				location.href="/";
			} else if(data=='2'){
				alert("관리자로그인 성공");
				$('#loginId,#password').val('');
				location.href="/";
			} else{
				$('#error').show();
				$('#loginId,#password').val('');
				$('#loginId').focus();
			}
		}
	}) 
	return false;
})

.on('click','#btnSignup',function(){
	location.href="/signup";
}) 


</script>
</html>