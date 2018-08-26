<%@page import="sample.Db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<script>
	<%
		// create,update를 제어하는 action.jsp
	
		request.setCharacterEncoding("UTF-8");
	
		Db db = new Db(); // db 객체 생성
		String action = request.getParameter("action"); // 회원 등록인지 수정인지 판별하는 플래그(변수)
		
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		String custno = request.getParameter("custno");
		
		if (action.equals("create")) { // 회원 등록
			if(db.createUser(custname, phone, address, joindate, grade, city)){ // 회원 등록에 성공했을 시
	%>
				alert("회원 등록에 성공했습니다!"); 
				location.href="member_list.jsp";
	<%
			}else{
	%>
				alert("회원 등록에 실패했습니다!");
				history.back();
	<%
			}
		} else if (action.equals("update")) { // 회원 정보 수정
			if(db.updateUser(custname, phone, address, joindate, grade, city, custno)){
	%>
				alert("회원 정보 수정에 성공했습니다!"); 
				location.href="member_list.jsp";
	<%
			}else {
	%>
				alert("회원 정보 수정에 실패했습니다!");
				history.back(); 
	<%			
			}
		}
	%>
</script>
</body>
</html>