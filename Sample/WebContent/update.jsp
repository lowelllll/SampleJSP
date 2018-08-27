<%@page import="java.sql.ResultSet"%>
<%@page import="sample.Db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쇼팡몰 회원 관리 ver 1.0</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/edit.css"/>
<%
	String custno = "";
	custno = request.getParameter("custno"); 
	
	Db db = new Db();
	ResultSet rs = db.selectUser(custno); // 회원 정보를 얻어옴.
	while(rs.next()){
%>
</head>
<body>
	<div class="wrap">
		<%@include file ="header.jsp" %>
		<section>
			<article>
				<div>
					<h2>홈쇼핑 회원 정보 수정</h2>
					<form action="action.jsp" name="form" method="post">
						<table>
							<tr>
								<td>회원 번호</td>
								<td><input type="text" name="custno" value="<%=rs.getString(1) %>" readonly /></td>
							</tr>
							<tr>
								<td>회원 성명</td>
								<td><input type="text" name="custname" maxlangth="10" value="<%=rs.getString(2)%>"/></td>
							</tr>
							<tr>
								<td>회원 전화</td>
								<td><input type="text" name="phone" maxlength="13" value="<%=rs.getString(3)%>"/></td>
							</tr>
							<tr>
								<td>회원 주소</td>
								<td><input type="text" name="address" maxlength="60" value="<%=rs.getString(4)%>"/></td>
							</tr>
							<tr>
								<td>가입 일자</td>
								<td><input type="date" name="joindate" id="joindate"/></td>
							</tr>
							<tr>
								<td>고객 등급 [A:VIP,B:일반,C:직원]</td>
								<td><input type="text" name="grade" maxlength="1" value="<%=rs.getString(6)%>"/></td>
							</tr>
							<tr>
								<td>도시코드</td>
								<td><input type="text" name="city" maxlength="2" value="<%=rs.getString(7)%>"/></td>
							</tr>
							<input type="hidden" name="action" value="update"/>
							<tr>
								<td colspan="2">
									<button type="button" class="btn">등록</button>
									<a href=""><button type="button">조회</button></a>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</article>
		</section>
		<%@include file ="footer.jsp" %>
	</div>
</body>
<script>
	// input에 date 설정
	document.getElementById("joindate").value = "<%=rs.getString(5)%>";
	
	var btn = document.getElementsByClassName("btn")[0]; // button 
	var form = document.forms['form']; // form 
	var field = ["회원 성명","회원 전화","회원 주소","가입 일자","고객 등급","도시 코드"] // 필드 이름
	
	btn.onclick = on; // 버튼을 클릭했을 때 on 함수 호출.
	
	function on () {
		if(isNull()){ // 비어있지 않다면 
			form.submit(); // submit
		}
	}
	
	
	function isNull () { // input이 비었는지 확인하는 함수
		for (var i = 1; i<7; i++) {
			if(form[i].value == "" || !form[i].value){ // 해당 input이 비었을 때
				alert(field[(i-1)]+"이 입력되지 않았습니다.");  
				form[i].focus(); // 해당 input focus
				return false;
			}
		}
		return true;
	}
<% 
	}
%>
</script>
</html>