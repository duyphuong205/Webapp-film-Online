<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty message}">
	<div class="row">
		<div class="col-sm-12">
			<div class="alert alert-success text-center">
				<h3>${message}</h3>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${not empty error}">
	<div class="row">
		<div class="col-sm-12">
			<div class="alert alert-danger text-center">
				<h3>${error}</h3>
			</div>
		</div>
	</div>
</c:if>