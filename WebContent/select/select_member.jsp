<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보조회/수정</title>
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
	width: 1200px;
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
				String sql = "select count(*) from member0216";
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
		<h2>회원 정보 목록</h2>
		<div class="cnt">
		<span>총 <b><%=cnt %>명</b>의 회원이 있습니다.</span>
		</div>
		<table>
			<tr>
				<th width=60>no</th>
				<th width=100>회원번호</th>
				<th width=100>회원성명</th>
				<th width=120>전화번호</th>
				<th width=200>주소</th>
				<th width=110>가입일자</th>
				<th width=80>고객등급</th>
				<th width=80>거주지역</th>
				<th width=300>관심상품</th>
				<th width=70>구분</th>
			</tr>
			<%
				int no = 0;
				try{
					String sql ="select custno, custname, phone, address, to_char(joindate,'yyyy-mm-dd'), grade, city, goods from member0216 order by custno";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String custno = rs.getString(1);
						String custname = rs.getString(2);
						String phone = rs.getString(3);
						String address = rs.getString(4);
						String joindate = rs.getString(5);
						String grade = rs.getString(6);
						String city = rs.getString(7);
						String goods = rs.getString(8);
						no++;
					
						if(grade.equals("A")){grade="VIP";}
						else if(grade.equals("B")){grade="일반";}
						else if(grade.equals("C")){grade="직원";}
						
						if(city.equals("01")){city="서울";}
						else if(city.equals("02")){city="경기";}
						else if(city.equals("10")){city="대전";}
						else if(city.equals("20")){city="부산";}
						else if(city.equals("30")){city="광주";}
						else if(city.equals("40")){city="울산";}
						else if(city.equals("50")){city="대구";}
						else if(city.equals("60")){city="강원";}
						else if(city.equals("70")){city="경상";}
						else if(city.equals("80")){city="충청";}
						else if(city.equals("90")){city="제주";}						
						%>
			<tr>
				<td><%=no %></td>
				<td><a href="/HRD0216/member0216/update_member.jsp?custno=<%=custno %>"><%=custno %></a></td>
				<td><%=custname %></td>
				<td><%=phone %></td>
				<td><p id="p1"><%=address %></p></td>
				<td><%=joindate %></td>
				<td><%=grade %></td>
				<td><%=city %></td>
				<td><p id="p1"><%=goods %></p></td>
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