<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title" /></title>	
	<tiles:insertAttribute name="headinfo"/>
</head>
<body>
	<tiles:insertAttribute name="header" />
						
	<tiles:insertAttribute name="body" />
	
	<div class="common_popup">
		<tiles:insertAttribute name="common_popup" />
	</div>		
	
	<tiles:insertAttribute name="footer" />
</body>
</html>