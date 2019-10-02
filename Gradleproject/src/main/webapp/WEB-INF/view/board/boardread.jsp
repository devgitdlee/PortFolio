<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<!-- Bootstrap CSS --> 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />


<title>boardread</title>
<script>
	$(document).on('click', '#btnList', function(e){

		e.preventDefault();

		

		location.href="/board";

	});

</script>

<style>

body {

  padding-top: 70px;

  padding-bottom: 30px;

}



</style>

</head>

<body>
	

	<article>

		<div class="container" role="main">

			<h2>board Form</h2>

				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="btitle" id="btitle" value=${btitle} readonly>

				</div>

				

				<div class="mb-3">

					<label for="reg_id">작성자</label>

					<input type="text" class="form-control" name="bname" id="bname" value=${bname} readonly>

				</div>

				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="bcontent" id="bcontent" readonly>${bcontent}</textarea>

				</div>

				

				<div class="mb-3">

					<label for="tag">TAG</label>

					<input type="text" class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요" hide=true>

				</div>

		

			<div >


				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

			</div>

		</div>

	</article>

</body>

</html>