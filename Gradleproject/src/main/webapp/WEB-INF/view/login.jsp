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
			//alert("���̵� �Է��ϼ���.");
			$("#msg").html('���̵� �Է��ϼ���').show();
			$("#userid").focus();
			return false;
		}

		if($("#userpasswd").val() == ""){
			alert("��й�ȣ�� �Է��ϼ���.");
			$("#userpasswd").focus();
			return false;
		}
		alert("login�۵�")
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
				alert("�α��οϷ�.");
		  	} else{
				alert("�α��κҰ�");
				return false;
			}
	    },
	    error: function (request, status, error){        
			console.log("����");
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
		���̵�:  <input type="text" id="userid" name="userid" maxlength="20"><br>
		��й�ȣ: <input type="password" id="userpasswd" name="userpasswd" maxlength="15"><br>
		<p id="msg" class="ipt_wrn_msg" style="">
		</p>
		<input type="submit" name="submit" value="�α���"/>  <input type="button" value="ȸ������" onclick="location.href='/join'">
	</form>
</div>

</body>
</html>