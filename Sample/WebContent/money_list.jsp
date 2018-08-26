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
	ResultSet rs = db.selectMoneyList();
%>
</head>
<body>
	<div class="wrap">
		<%@include file ="header.jsp" %>
		<section>
			<article>
				<h2>회원 매출 조회</h2>
				<table class="money_table">
					<thead>
						<tr>
							<th>회원 번호</th>
							<th>회원 성명</th>
							<th>고객 등급</th>
							<th>매출</th>
						</tr>
					</thead>
					<tbody>
					<%
						while(rs.next()){
					%>
						<tr>
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3).equals("A") ? "VIP" :rs.getString(3).equals("B") ? "일반" : "직원" %></td> <!-- 3항 연산자  -->
							<td><%=rs.getString(4) %></td>
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