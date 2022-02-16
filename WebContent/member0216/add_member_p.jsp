<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp" %>

<%
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	String goods[] = request.getParameterValues("goods");
	String chk = "";
	for(int i=0; i<goods.length; i++){
		if((i+1) == goods.length){
			chk = chk + goods[i];
		}else{
			chk = chk + goods[i] + ",";
		}
		
	}
	System.out.println("goods 체크 : "+chk);
	
	try{
		String sql = "insert into member0216 values(?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		pstmt.setString(8, chk);
		pstmt.executeUpdate();
		System.out.println(custno+"("+custname+") 등록 성공");
		%>
		<script>
			alert('회원등록이 완료 되었습니다!');
			location.href='/HRD0216/select/select_member.jsp';
		</script>
		<%
		
		
	}catch(SQLException e){
		System.out.println("등록 실패");
		%>
		<script>
			alert('등록 실패');
			history.back(-1);
		</script>
		<%
		e.printStackTrace();
	}
%>

