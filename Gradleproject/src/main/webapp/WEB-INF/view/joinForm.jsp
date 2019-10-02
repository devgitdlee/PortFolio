<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>회원가입 화면</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="..\..\rss\css\index.css">
	<script language="javascript" src="..\..\rss\js\jquery-3.4.1.js"></script>
	<script>
	
	//필수입력 정보 아이디 비밀번호 입력체크
	function checkValue(){
		if($("#userid").val() == ""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}

		if($("#userpasswd").val() == ""){
			alert("비밀번호를 입력하세요.");
			$("#userpasswd").focus();
			return false;
		}

		if($("#userpasswd").val() != $("#passwordcheck").val()){
			alert("비밀번호를 동일하게 입력하세요.");
			$("#userpasswd").focus();
			return false;
		}
		var birthday = $("#birth_yy").val() + $("#birth_mm").val() + $("#birth_dd").val()
		$("#birthday").val() = birthday
		alert(birthday)
		$("#email").val() = $("#email_1").val() + "@" + $("#email_2").val()
		alert($("#birthday").val())	
		alert($("#email").val())
	}	
	</script>
	<script>
	$(document).ready(function(){

		});
	$(function(){
	//아이디 중복체크
		$("#userid").blur(function() {
			var userid = $("#userid").val();
			console.log(userid);
			
			$.ajax({
			    url: "/userid/check",
			    data : userid,
			    type: "POST",
		    success: function(data){
			    console.log(data);
		  		if (data == 0){
					alert("사용가능한 아이디입니다.");
			  	} else{
					alert("사용불가한 아이디입니다.");
				}
		    },
		    error: function (request, status, error){        
				console.log("실패");
		    }
		  	});
		});
	})
	</script>
</head>
<body>
    <!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        
        <form onsubmit="return checkValue()" method="post" name="userInfo" >
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" id="userid" name="userid" maxlength="20">   
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" id="userpasswd" name="userpasswd" maxlength="15">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" id= "passwordcheck" name="passwordcheck" maxlength="15">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" id="username" name="username" maxlength="40">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" id="gender" name="gender" value="1" checked>남
                        <input type="radio" id="gender" name="gender" value="2" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    	<input type="hidden" id=birthday name=birthday value="">
                    <td>
                        <input type="text" id="birth_yy" name="birth_yy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select id="birth_mm" name="birth_mm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" id="birth_dd" name="birth_dd" maxlength="2" placeholder="일" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    	<input type="hidden" id=email name=email>
                    <td>
                        <input type="text" name="email_1" maxlength="30">@
                        <select name="email_2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" id="phone" name="phone" />
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" id="address" size="50" name="address"/>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" name="submit" value="가입"/> <input type="button" value="로그인">  <input type="button" value="취소">
        </form>
    </div>
</body>
</html>


