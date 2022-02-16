<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp" %>

<%
	String custno = request.getParameter("custno");
	
	try{
		String sql = "delete from member0216 where custno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.executeUpdate();
		System.out.println("삭제 성공");
		%>
		<script>
			alert('삭제가 완료 되었습니다!');
			location.href='/HRD0216/select/select_member.jsp';
		</script>
		<%
		
		
	}catch(SQLException e){
		System.out.println("삭제 실패");
		%>
		<script>
			alert('삭제 실패');
			history.back(-1);
		</script>
		<%
		e.printStackTrace();
	}
%>

