<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메세지</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<style>
		
		</style>
	</head>
	
	<body>
		
	</body>
	
	<script>
		alert("${msg}");
		location.replace("${pageContext.request.contextPath}${url}");
	</script>
</html>