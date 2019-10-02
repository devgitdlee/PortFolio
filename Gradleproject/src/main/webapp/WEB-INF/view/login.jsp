<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="..\..\rss\css\index.css">
	<script language="javascript" src="..\..\rss\js\jquery-3.4.1.js"></script>
	<script>
	function checkValue(){
		if($("#userid").val() == ""){
			//alert("아이디를 입력하세요.");
			$("#msg").html('아이디를 입력하세요').show();
			$("#userid").focus();
			return false;
		}

		if($("#userpasswd").val() == ""){
			alert("비밀번호를 입력하세요.");
			$("#userpasswd").focus();
			return false;
		}
		alert("login작동")
		var loginlist = JsonData();
		console.log(loginlist);
		
		$.ajax({
		    url: "/userid/login",
		    data : loginlist,
		    dataType : "json",
		    type: "POST",
	    success: function(data){
		    console.log(data);
	  		if (data == 1){
				alert("로그인완료.");
		  	} else{
				alert("로그인불가");
				return false;
			}
	    },
	    error: function (request, status, error){        
			console.log("실패");
	    }
		});//ajax
	}
	function JsonData(){
			var userid = $("#userid").val();
			var userpasswd = $("#userpasswd").val();
			var jsoninfo = new Object();
			jsoninfo.userid = userid;
			jsoninfo.userpasswd = userpasswd;
			return jsoninfo
	}
	</script>
</head>
<body>
<div id=loginform>
	<form onsubmit="return checkValue()" method="post" name="login" >
		아이디:  <input type="text" id="userid" name="userid" maxlength="20"><br>
		비밀번호: <input type="password" id="userpasswd" name="userpasswd" maxlength="15"><br>
		<p id="msg" class="ipt_wrn_msg" style="">
		</p>
		<input type="submit" name="submit" value="로그인"/>  <input type="button" value="회원가입" onclick="location.href='/join'">
	</form>
</div>

</body>
</html>