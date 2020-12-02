<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href='${contextPath}/'><span class="glyphicon glyphicon-home"></span></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href='${contextPath}/'>Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="${contextPath}/board/boardList">Test Board</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      <c:if test="${user == null }">
        <li><a href='${contextPath}/member/login'><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </c:if>
      <c:if test="${user != null }">
		<li><a href='#'><span class="glyphicon glyphicon-user"></span>${user.mname }'s Page</a></li>
     	<li><a href='${contextPath}/member/logout'><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </c:if>
      </ul>
    </div>
  </div>
</nav>
<div style="margin-top:30px">&#8203;</div>