<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원매출조회</title>
<style>
th {
	height: 35px;
	background: whitesmoke;
}

td {
	height: 25px;
	text-align: center;
}

.cnt{
	display: table;
	margin: 0 auto;
	width: 980px;
	height: 25px;
	text-align: left;
	font-size: 0.9em;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<%
			int cnt = 0;
			try {
				String sql = "select count(*) from money0216";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("count 조회 실패");
				e.printStackTrace();
			}
		%>
		<h2>회원 매출 정보 목록</h2>
		<div class="cnt">
		<span>총 <b><%=cnt %>건</b>의 매출정보가 있습니다.</span>
		</div>
		<table>
			<tr>
				<th width=60>no</th>
				<th width=100>회원번호</th>
				<th width=100>회원이름</th>
				<th width=100>판매번호</th>
				<th width=80>단가</th>
				<th width=70>수량</th>
				<th width=90>가격</th>
				<th width=90>상품코드</th>
				<th width=90>상품명</th>
				<th width=120>판매일자</th>
				<th width=70>구분</th>
			</tr>
			<%	
				DecimalFormat df = new DecimalFormat("###,###");
				int no = 0;
				try{
					String sql ="select a.custno, b.custname, a.saleno, a.pcost, a.amount, a.price, a.pcode, c.pname, to_char(a.sdate,'yyyy-mm-dd') from money0216 a, member0216 b, product0216 c where a.custno=b.custno and a.pcode=c.pcode order by a.custno";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String custno = rs.getString(1);
						String custname = rs.getString(2);
						String saleno = rs.getString(3);
						int pcost = rs.getInt(4);
						int amount = rs.getInt(5);
						int price = rs.getInt(6);
						String pcode = rs.getString(7);
						String pname = rs.getString(8);
						String sdate = rs.getString(9);
						no++;				
						%>
			<tr>
				<td><%=no %></td>
				<td><a href="/HRD0216/member0216/update_member.jsp?custno=<%=custno %>"><%=custno %></a></td>
				<td><%=custname %></td>
				<td><%=saleno %></td>
				<td><%=df.format(pcost) %></td>
				<td><%=amount %></td>
				<td><p id="p2"><%=df.format(price) %></p></td>
				<td><%=pcode %></td>
				<td><%=pname %></td>
				<td><%=sdate %></td>
				<td><a href="/HRD0216/member0216/delete_member.jsp?custno=<%=custno %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false}">삭제</a></td>				
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