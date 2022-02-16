<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보등록</title>
<style>
tr {
	height: 30px;
}

th {
	width: 150px;
	background: whitesmoke;
}

td {
	width: 600px;
}

#in1 {
	width: 30%;
	height: 22px;
	margin-left: 2px;
}

#in2 {
	width: 60%;
	height: 22px;
	margin-left: 2px;
}

#sel1 {
	width: 20%;
	height: 25px;
	margin-left: 2px;
}

#chk1 {
	margin-left: 2px;
}
</style>
<script>
	function check() {
		if(document.form.custname.value==""){
			alert('회원성명을 입력하세요');
			document.form.custname.focus();
		}else if(document.form.phone.value==""){
			alert('회원전화를 입력하세요');
			document.form.phone.focus();
		}else if(document.form.address.value==""){
			alert('회원주소를 입력하세요');
			document.form.address.focus();
		}else if(document.form.joindate.value==""){
			alert('가입일자를 입력하세요');
			document.form.joindate.focus();
		}else if(document.form.grade.value==""){
			alert('고객등급를 입력하세요');
			document.form.grade.focus();
		}else if(document.form.city.value==""){
			alert('도시코드를 입력하세요');
			document.form.city.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
	<%
		String send_custno = request.getParameter("custno");
		try{
			String sql ="select custno, custname, phone, address, to_char(joindate,'yyyy-mm-dd'), grade, city, goods from member0216 where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_custno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String custno = rs.getString(1);
				String custname = rs.getString(2);
				String phone = rs.getString(3);
				String address = rs.getString(4);
				String joindate = rs.getString(5);
				String grade = rs.getString(6);
				String city = rs.getString(7);
				String goods = rs.getString(8);
				
				String arr_goods[] = goods.split(",");
				%>
				
		<h2>쇼핑몰 회원관리 프로그램</h2>
		<form name="form" method="post" action="update_member_p.jsp">
			<table>
				<tr>
					<th>회원번호(자동생성)</th>
					<td><input id="in1" type="text" name="custno" value="<%=custno%>" readonly>
				</tr>
				
				<tr>
					<th>회원성명</th>
					<td><input id="in2" type="text" name="custname" value="<%=custname%>">
				</tr>
				
				<tr>
					<th>회원전화</th>
					<td><input id="in2" type="text" name="phone" value="<%=phone%>">
				</tr>
				
				<tr>
					<th>회원주소</th>
					<td><input id="in2" type="text" name="address" value="<%=address%>">
				</tr>
				
				<tr>
					<th>가입일자</th>
					<td><input id="in2" type="text" name="joindate" value="<%=joindate%>">
				</tr>
				
				<tr>
					<th>고객등급</th>
					<td><select id="sel1" name="grade">
						<option value="" <%if(grade.equals("")){%>selected<%}%>>선택하세요.</option>
						<option value="A" <%if(grade.equals("A")){%>selected<%}%>>A: VIP</option>
						<option value="B" <%if(grade.equals("B")){%>selected<%}%>>B: 일반</option>
						<option value="C" <%if(grade.equals("C")){%>selected<%}%>>C: 직원</option>
					</select></td>
				</tr>
				
								<tr>
					<th>거주도시</th>
					<td><select id="sel1" name="city">
						<option value="" <%if(city.equals("")){%>selected<%}%>>선택하세요.</option>
						<option value="01" <%if(city.equals("01")){%>selected<%}%>>서울</option>
						<option value="02" <%if(city.equals("02")){%>selected<%}%>>경기</option>
						<option value="10" <%if(city.equals("10")){%>selected<%}%>>대전</option>
						<option value="20" <%if(city.equals("20")){%>selected<%}%>>부산</option>
						<option value="30" <%if(city.equals("30")){%>selected<%}%>>광주</option>
						<option value="40" <%if(city.equals("40")){%>selected<%}%>>울산</option>
						<option value="50" <%if(city.equals("50")){%>selected<%}%>>대구</option>
						<option value="60" <%if(city.equals("60")){%>selected<%}%>>강원</option>
						<option value="70" <%if(city.equals("70")){%>selected<%}%>>경상</option>
						<option value="80" <%if(city.equals("80")){%>selected<%}%>>충청</option>
						<option value="90" <%if(city.equals("90")){%>selected<%}%>>제주</option>
					</select></td>
				</tr>
				
				<tr>
					<th>관심상품</th>
					<td>
						<input id="chk1" type="checkbox" name="goods" value="의류" <%for(int i=0;i<arr_goods.length;i++)if("의류".equals(arr_goods[i]))out.print("checked");%>>의류
						<input id="chk1" type="checkbox" name="goods" value="식료품" <%for(int i=0;i<arr_goods.length;i++)if("식료품".equals(arr_goods[i]))out.print("checked");%>>식료품
						<input id="chk1" type="checkbox" name="goods" value="컴퓨터" <%for(int i=0;i<arr_goods.length;i++)if("컴퓨터".equals(arr_goods[i]))out.print("checked");%>>컴퓨터
						<input id="chk1" type="checkbox" name="goods" value="공산품" <%for(int i=0;i<arr_goods.length;i++)if("공산품".equals(arr_goods[i]))out.print("checked");%>>공산품
						<input id="chk1" type="checkbox" name="goods" value="관광" <%for(int i=0;i<arr_goods.length;i++)if("관광".equals(arr_goods[i]))out.print("checked");%>>관광
						<input id="chk1" type="checkbox" name="goods" value="전자제품" <%for(int i=0;i<arr_goods.length;i++)if("전자제품".equals(arr_goods[i]))out.print("checked");%>>전자제품
						<input id="chk1" type="checkbox" name="goods" value="건강제품" <%for(int i=0;i<arr_goods.length;i++)if("건강제품".equals(arr_goods[i]))out.print("checked");%>>건강제품
						<input id="chk1" type="checkbox" name="goods" value="운동기구" <%for(int i=0;i<arr_goods.length;i++)if("운동기구".equals(arr_goods[i]))out.print("checked");%>>운동기구
					</td>
				</tr>
				
				<tr id="tr_btn">
					<td colspan=2 align="center">
						<input id="btn1" type="button" value="목록" onclick="location.href='/HRD0216/select/select_member.jsp'">
						<input id="btn1" type="button" value="수정" onclick="check()">						
					</td>
				</tr>				
			</table>
		</form>
		<%
			}
		}catch(SQLException e){
			System.out.println("테이블 조회 실패");
			e.printStackTrace();
		}
	%>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>