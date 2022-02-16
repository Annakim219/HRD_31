<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원매출조회(회원번호별)</title>
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
		<h2>회원 매출 정보 목록(회원번호별)</h2>
		<table>
			<tr>
				<th width=60>no</th>
				<th width=100>상품코드</th>
				<th width=100>상품명</th>
				<th width=120>매출</th>

			</tr>
			<%	
				DecimalFormat df = new DecimalFormat("###,###");
				int no = 0;
				try{
					String sql ="select c.pcode, c.pname, sum(a.price) from money0216 a, product0216 c where a.pcode=c.pcode group by c.pcode, c.pname order by c.pcode";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String pcode = rs.getString(1);
						String pname = rs.getString(2);
						int p_price = rs.getInt(3);
						no++;			
						
						%>
			<tr>
				<td><%=no %></td>
				<td><%=pcode%></td>
				<td><%=pname %></td>
				<td><p id="p2"><%=df.format(p_price)%></p></td>			
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