<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!-- Header -->
<%@ include file="./includes/Header.jsp"%>

<!-- NavTop -->
<%@ include file="./includes/NavTop.jsp"%>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src='${contextPath }/resources/images/coco.jpg' alt="Coco"  style="width:auto; height:400px;">
      <div class="carousel-caption">
        <h3>Coco</h3>
        <p>Coco from Coco Chanel :3 </p>
      </div>
    </div>

    <div class="item">
      <img src='${contextPath }/resources/images/lolo.jpg' alt="Lolo" style="width:auto; height:400px;">
      <div class="carousel-caption">
        <h3>Lolo</h3>
        <p>Lolo from Lolo Piana :3</p>
      </div>
    </div>

    <div class="item">
      <img src='${contextPath }/resources/images/gom.jpg' alt="Gom" style="width:auto; height:400px;">
      <div class="carousel-caption">
        <h3>Gom</h3>
        <p>Gom from Bear ;3</p>
      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="container-fluid text-center">    
	<div class="row content">
	    <div class="col-sm-8 text-left"> 
	      <h1> Welcome!!<c:if test="${user!=null }"> ${user.mname }님이 접속 하셨습니다 :3 </c:if></h1>
	      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	      <hr>
	      <h3>Test</h3>
	      <p>Lorem ipsum...</p>
	    </div>
	    <div class="col-sm-2 sidenav">
	      <div class="well">
	        <p>ADS</p>
	      </div>
	      <div class="well">
	        <p>ADS</p>
	      </div>
	    </div>
  </div>
  <input type='hidden' name='mid' value=' ${user.mid }' />
</div>
<!-- Bottom -->
<%@ include file="./includes/Bottom.jsp"%>
