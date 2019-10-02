<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		
	});
	$(function(){
			console.log("board페이지작동")
			
			
			$.ajax({
			    url: "/board/check",
			    dataType : "json",
			    type: "GET",
		    success: function(data){
		    	var len = Object.keys(data.board).length;
		    	for(var i = len-1; i>=0; i--){
			    	var bid = data.board[i].bid;
			    	var btitle = data.board[i].btitle;
			    	var bname = data.board[i].bname;
			    	var bdate = data.board[i].bdate;
		    		$('#boardtable > tbody:last').append('<tr><td>'+ bid + '</td><td><a href=/board/boardread?bbid='+bid+'>'+ btitle + '</a></td>' + 
														 '<td>' + bname + '</td>' +  '<td>' + bdate + '</td></tr>');
			    }
			    
		    },
		    error: function (request, status, error){        
				console.log("실패");JSON
		    }
		  	});
	})
	
</script>
</head>
<body>
		<!-- 네비게이션  -->

		<nav class="navbar navbar-default">

			<div class="navbar-header">

				<button type="button" class="navbar-toggle collapsed"

					data-toggle="collapse" data-target="bs-example-navbar-collapse-1"

					aria-expaned="false">

					<span class="icon-bar"></span> <span class="icon-bar"></span> <span

						class="icon-bar"></span>

				</button>

				<a class="navbar-brand" href="main.jsp">JSP 게시판</a>

			</div>

			<div class="collapse navbar-collapse"

				id="#bs-example-navbar-collapse-1">

				<ul class="nav navbar-nav">

					<li><a href="main.jsp">메인</a></li>

					<li class="active"><a href="bbs.jsp">게시판</a></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"

						data-toggle="dropdown" role="button" aria-haspopup="true"

						aria-expanded="false">접속하기<span class="caret"></span></a>

						<ul class="dropdown-menu">

							<li><a href="login">로그인</a></li>

							<li><a href="joinForm">회원가입</a></li>

						</ul></li>

				</ul>


				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"

						data-toggle="dropdown" role="button" aria-haspopup="true"

						aria-expanded="false">회원관리<span class="caret"></span></a>

						<ul class="dropdown-menu">

							<li><a href="logoutAction.jsp">로그아웃</a></li>

						</ul></li>
				</ul>
			</div>
		</nav>

		<!-- 게시판 -->

		<div class="container">
			<div class="row">
				<table class="table table-striped" id="boardtable"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>

				<!-- 페이지 넘기기 -->
				<a href="bbs.jsp?pageNumber="
					class="btn btn-success btn-arrow-left">이전</a>
				<a href="bbs.jsp?pageNumber="
					class="btn btn-success btn-arrow-left">다음</a>
				<a href="/board/boardwrite" class="btn btn-primary pull-right">글쓰기</a>
				<button class="btn btn-primary pull-right"
					onclick="if(confirm('로그인 하세요'))location.href='boardwrite';"
					type="button">글쓰기</button>
			</div>
		</div>
</body>
</html>