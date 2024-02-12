<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=(String)session.getAttribute("id"); // session 설정있음
%>
<div id="menu">
<% if (id == null) { %>
    <a href="/login" class="menuBar">로그인</a>
    <a href="/signup" class="menuBar">회원가입</a>
  <% } else { %>
    <a><%=id%>님 반갑습니다.</a>
    <a href="/logout" class="menuBar"  id=do_logout>로그아웃</a> 
  <% } %>
  <a href="/cart" class="menuBar">장바구니</a>
  <a href="/mypage" class="menuBar">마이페이지</a>
  <a href="/customer" class="menuBar">고객센터</a>
</div>
<div class="space">
</div>
<div id="logo">
  <a href="/">
    <img src="/img/logo.jpg" id="homeIcon">
  </a>
</div>
<div class="space">
</div>
<script src='http://code.jquery.com/jquery-latest.js'></script>
<script> 
$(document)
.on('click','#do_logout',function(){
	$.ajax({
		type:'post',
		url:'/logout',
		data:{},
		dataType:'text',
		success:function(data){
			if(data=='1') {
			  location.href="/";
			}	
		}
	}) 
	 return false;
})
</script>