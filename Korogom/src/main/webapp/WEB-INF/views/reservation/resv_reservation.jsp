<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="${contextPath}/WEB-INF/views/includes/header.jsp" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<div class="row">
	<div class="col-lg-12">
		<h2>Room Register</h2>
	</div>
</div>
<div class="row">
	<div class="col-lg-1">
		Slide
	</div>
	<div class="col-lg-10">
	<div class="panel panel-default">
		<div class="panel-heading">Resrvation Register</div>
		<div clas="panel-body">
		<form role="form" action="/reservation/resv_reservation" method="post">
            <div class="form-group">
            <label>예약숙소</label>
            <input type="text" name="roomno" value='<c:out value="${room.roomno}"/>' readonly="readonly">
            </div>
            <div class="form-group">
            <label for="istart">체크인</label>
              <input type="text" name="istart" id="istart" required="required">
            <label for="iend">체크아웃</label>
              <input type="text" name="iend" id="iend" required="required">
            </div>
            <div class="form-group">
            <label for="roomprice">숙박동물 수</label>
              <select name="icnt">
              	<option value="1" selected="selected">1</option>
             	<option value="2">2</option>
              	<option value="3">3</option>
            	<option value="4">4</option>
            	<option value="5">5</option>
              </select>
             </div>
            <div class="form-group">
            <label for="ipet">숙박동물 이름</label>
              	<input type="text" name="ipet" required="required">
            </div>
            <div class="form-group">
            <label for="ifood">사료</label>
              	<select name="ifood">
              		<option value="dog" selected="selected">Dogfood</option>
              		<option value="cat">Catfood</option>
              	</select>
            </div>
            <div class="form-group">
             <label for="iadd">추가사항</label>
              	<input type="text" name="iadd">
            </div>
            <div class="form-group">
             <label for="isend">송금인</label>
              	<input type="text" name="isend" required="required">
            </div>
            <div class="form-group">
             <label for="iplus">참고사항</label>
              	<input type="text" name="iplus">
            </div>
            <div class="form-group">
             <label for="p1">연락처</label>
              	<select name="p0" id="p0">
              		<option value="031">031</option>
              		<option value="010">010</option>
              		<option value="011">011</option>
              		<option value="016">016</option>
              		<option value="017">017</option>
              		<option value="019">019</option>
              	</select>
              	<input type="hidden" name="p1" value="031">
              	-<input type="tel" name="p2" required="required">
              	-<input type="tel" name="p3" required="required">
            </div>
            <div class="form-group">
             <label for="ietc">비고</label>
              	<input type="text" name="ietc">
              	<input type="hidden" name="mno" value="0">
            </div>
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="reset" class="btn btn-danger">초기화</button>
         </form>
	    </div>
    	</div>
    	<p id="demo"></p>
    </div>
	<div class="col-lg-1">
		Slide
	</div>
</div>
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	$("#p0").change(function(){
	    var p0 =  $(this).val();
	    $("input[name=p1]").val(p0)
	    console.log(p0);
	});
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		var str = "";
		var p1 = $('input[name=p1]').val();
		var p2 = $('input[name=p2]').val();
		var p3 = $('input[name=p3]').val();
		str += "<input type='hidden' name='pno' value='"+p1+p2+p3+"'>";
		
		console.log(str);
		formObj.append(str).submit();
	});
});
</script>
<script type="text/javascript">
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#istart" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 minDate: 0,
                 maxDate: 30, 
                 onClose: function( selectedDate ) {  ;
                     $("#iend").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#iend" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 maxDate: 30,
                 onClose: function( selectedDate ) {    
                     $("#istart").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
</script>
</body>
</html>