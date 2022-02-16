<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품매출조회(상품코드별)</title>
<style>
th {
	height: 35px;
	background: whitesmoke;
}

td {
	height: 25px;
	text-align: center;
}

</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<h2>상품 매출 정보 목록</h2>
		<table>
			<tr>
				<th width=60>no</th>
				<th width=100>회원번호</th>
				<th width=100>회원이름</th>
				<th width=90>고객등급</th>
				<th width=120>매출</th>

			</tr>
			<%	
				DecimalFormat df = new DecimalFormat("###,###");
				int no = 0;
				try{
					String sql ="select a.custno, b.custname, b.grade, sum(a.price) from money0216 a, member0216 b where a.custno=b.custno group by a.custno, b.custname, b.grade order by sum(a.price) desc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String custno = rs.getString(1);
						String custname = rs.getString(2);
						String grade = rs.getString(3);
						int s_price = rs.getInt(4);
						no++;			
						
						if(grade.equals("A")){grade="VIP";}
						else if(grade.equals("B")){grade="일반";}
						else if(grade.equals("C")){grade="직원";}
						%>
			<tr>
				<td><%=no %></td>
				<td><%=custno%></td>
				<td><%=custname %></td>
				<td><%=grade %></td>
				<td><p id="p2"><%=s_price %></p></td>			
			</tr>
					<%
					}					
				}catch(SQLException e){
					System.out.println("테이블 조회 실패");
					e.printStackTrace();
				}
			%>
		</table>
		<div class="btn_group" align="center">
			<input id="btn1" type="button" value="작성"
				onclick="location.href='/HRD0216/member0216/add_member.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>