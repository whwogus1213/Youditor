<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>회원정보수정 - YouDitor</title>
	<jsp:include page="../module/header.jsp" flush="false"/>
	<link href="/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../module/top2.jsp" flush="false"/>
	<div align="center">
		<form action="${path}/accounts/modAccount.do">
			<table>
				<tbody>
					<tr>
						<td>회원정보가 성공적으로 수정되었습니다.</td>
					</tr>
					<tr>
						<td><input type="submit" value="돌아가기"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<jsp:include page="../module/bottom.jsp" flush="false"/>
</body>
</html>