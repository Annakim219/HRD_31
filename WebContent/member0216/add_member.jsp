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
		int cust_no = 0;
		try{
			String sql ="select max(custno) from member0216";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				cust_no = rs.getInt(1)+1;				
			}
		}catch(SQLException e){
			System.out.println("max no 조회 실패");
			e.printStackTrace();
		}
	%>
		<h2>쇼핑몰 회원관리 프로그램</h2>
		<form name="form" method="post" action="add_member_p.jsp">
			<table>
				<tr>
					<th>회원번호(자동생성)</th>
					<td><input id="in1" type="text" name="custno" value="<%=cust_no%>">
				</tr>
				
				<tr>
					<th>회원성명</th>
					<td><input id="in2" type="text" name="custname">
				</tr>
				
				<tr>
					<th>회원전화</th>
					<td><input id="in2" type="text" name="phone">
				</tr>
				
				<tr>
					<th>회원주소</th>
					<td><input id="in2" type="text" name="address">
				</tr>
				
				<tr>
					<th>가입일자</th>
					<td><input id="in2" type="text" name="joindate">
				</tr>
				
				<tr>
					<th>고객등급</th>
					<td><select id="sel1" name="grade">
						<option value="" selected>선택하세요.</option>
						<option value="A">A: VIP</option>
						<option value="B">B: 일반</option>
						<option value="C">C: 직원</option>
					</select></td>
				</tr>
				
								<tr>
					<th>거주도시</th>
					<td><select id="sel1" name="city">
						<option value="" selected>선택하세요.</option>
						<option value="01">서울</option>
						<option value="02">경기</option>
						<option value="10">대전</option>
						<option value="20">부산</option>
						<option value="30">광주</option>
						<option value="40">울산</option>
						<option value="50">대구</option>
						<option value="60">강원</option>
						<option value="70">경상</option>
						<option value="80">충청</option>
						<option value="90">제주</option>
					</select></td>
				</tr>
				
				<tr>
					<th>관심상품</th>
					<td>
						<input id="chk1" type="checkbox" name="goods" value="의류">의류
						<input id="chk1" type="checkbox" name="goods" value="식료품">식료품
						<input id="chk1" type="checkbox" name="goods" value="컴퓨터">컴퓨터
						<input id="chk1" type="checkbox" name="goods" value="공산품">공산품
						<input id="chk1" type="checkbox" name="goods" value="관광">관광
						<input id="chk1" type="checkbox" name="goods" value="전자제품">전자제품
						<input id="chk1" type="checkbox" name="goods" value="건강제품">건강제품
						<input id="chk1" type="checkbox" name="goods" value="운동기구">운동기구
					</td>
				</tr>
				
				<tr id="tr_btn">
					<td colspan=2 align="center">
						<input id="btn1" type="button" value="등록" onclick="check()">
						<input id="btn1" type="button" value="취소" onclick="location.href='/HRD0216/index.jsp'">
					</td>
				</tr>				
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>