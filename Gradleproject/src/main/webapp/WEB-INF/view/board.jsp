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
			console.log("board�������۵�")
			
			
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
				console.log("����");JSON
		    }
		  	});
	})
	
</script>
</head>
<body>
		<!-- �׺���̼�  -->

		<nav class="navbar navbar-default">

			<div class="navbar-header">

				<button type="button" class="navbar-toggle collapsed"

					data-toggle="collapse" data-target="bs-example-navbar-collapse-1"

					aria-expaned="false">

					<span class="icon-bar"></span> <span class="icon-bar"></span> <span

						class="icon-bar"></span>

				</button>

				<a class="navbar-brand" href="main.jsp">JSP �Խ���</a>

			</div>

			<div class="collapse navbar-collapse"

				id="#bs-example-navbar-collapse-1">

				<ul class="nav navbar-nav">

					<li><a href="main.jsp">����</a></li>

					<li class="active"><a href="bbs.jsp">�Խ���</a></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"

						data-toggle="dropdown" role="button" aria-haspopup="true"

						aria-expanded="false">�����ϱ�<span class="caret"></span></a>

						<ul class="dropdown-menu">

							<li><a href="login">�α���</a></li>

							<li><a href="joinForm">ȸ������</a></li>

						</ul></li>

				</ul>


				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"

						data-toggle="dropdown" role="button" aria-haspopup="true"

						aria-expanded="false">ȸ������<span class="caret"></span></a>

						<ul class="dropdown-menu">

							<li><a href="logoutAction.jsp">�α׾ƿ�</a></li>

						</ul></li>
				</ul>
			</div>
		</nav>

		<!-- �Խ��� -->

		<div class="container">
			<div class="row">
				<table class="table table-striped" id="boardtable"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
							<th style="background-color: #eeeeee; text-align: center;">����</th>
							<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
							<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>

				<!-- ������ �ѱ�� -->
				<a href="bbs.jsp?pageNumber="
					class="btn btn-success btn-arrow-left">����</a>
				<a href="bbs.jsp?pageNumber="
					class="btn btn-success btn-arrow-left">����</a>
				<a href="/board/boardwrite" class="btn btn-primary pull-right">�۾���</a>
				<button class="btn btn-primary pull-right"
					onclick="if(confirm('�α��� �ϼ���'))location.href='boardwrite';"
					type="button">�۾���</button>
			</div>
		</div>
</body>
</html>