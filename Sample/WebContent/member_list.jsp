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
<link rel="stylesheet" href="css/table.css" />
<%
	Db db = new Db();
	ResultSet rs = db.selectUserList();
%>
</head>
<body>
	<div class="wrap">
		<%@include file ="header.jsp" %>
		<section>
			<article>
				<h2>홈쇼핑 회원 목록 조회 /수정</h2>
				<table class="member_table">
					<thead>
						<tr>
							<th>회원 번호</th>
							<th>회원 성명</th>
							<th>전화 번호 </th>
							<th>주소</th>
							<th>가입 일자</th>
							<th>고객 등급</th>
							<th>거주 지역</th>
						</tr>
					</thead>
					<tbody>
					<%
						while(rs.next()){
					%>
						<tr>
							<td><a href="update.jsp?custno=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getString(5) %></td>
							<td><%=rs.getString(6).equals("A") ? "VIP" :rs.getString(6).equals("B") ? "일반" : "직원" %></td> <!-- 3항 연산자  -->
							<td><%=rs.getString(7) %></td>
						</tr>
					<%		
						}
					%>
					</tbody>
				</table>
			</article>
		</section>
		<%@include file ="footer.jsp" %>
	</div>
</body>
</html>