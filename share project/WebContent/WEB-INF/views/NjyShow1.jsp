<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Chart Template</title>
	
	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="/dashboard-web2/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="/dashboard-web2/dist/css/adminlte.min.css">
</head>
<style>
div#searchPlay {
	position : absolute;
	top: 30%;
	left: 50%;
}
</style>
<body class="hold-transition sidebar-mini layout-fixed">

<div class="wrapper">

	<jsp:include page="/WEB-INF/views/modules/header.jsp" /> <!--  이미 만들어진 페이지를 재사용하기위하여 사용 -->
	
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">KBO 선수 정보</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->

          <!-- 검색박스  -->    
<section class="content">
<div class="container-fluid"> 
<div class="row" id="searchPlay">
<div class="sm-3">
<div class="card">
  <div class="card-header">
    <div class="card-body login-card-body">
      <p class="login-box-msg"><b>이름 입력</b></p>

		<div class="input-group input-group-sm" style="height:300; width: 300px;">
        <input class="form-control" type="text" id="nameInput" name="playerSearch"  placeholder="Search">
                </div>
                
                
<div class="social-auth-links text-center mb-3">

        <a id="lnk-search" href="#" class="btn btn-block btn-primary">
           <b>선수 검색</b>
        </a>

      </div>
        </div>

    </div>
    <!-- /.login-card-body -->
  </div>
  </div>
  </div>
</div>
</section>
<!-- /.login-box -->
   
    
 
  <!-- /.content-wrapper -->
</div>	    	
	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />


<!-- ./wrapper -->

<!-- jQuery -->
<script src="/dashboard-web2/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/dashboard-web2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dashboard-web2/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dashboard-web2/dist/js/demo.js"></script>
<!-- AdminLTE App -->
<script src="/dashboard-web2/dist/js/adminlte.min.js"></script>
<!-- FLOT CHARTS -->
<script src="/dashboard-web2/plugins/flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="/dashboard-web2/plugins/flot/plugins/jquery.flot.resize.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="/dashboard-web2/plugins/flot/plugins/jquery.flot.pie.js"></script>
<script>
  
  // 동일 이름 보여주기 -시작
  $(function () {
 
		var outerBox = $('<div></div>');
		outerBox.css({
			"border": "solid 1px",
			"background-color": "white",
			"width": "300px",
			"display": "none",
			"position": "absolute",
			"left": getLeft(),
			"top": getTop()
		});
		outerBox.appendTo("body"); // $('body').append(outerBox)
		
		$('body').on('click', function(event) {
			outerBox.css({'display' : 'none'})
		});
		
		$('#nameInput').on('keyup', function(event) {
			var playerName = $(this).val();
			console.log( playerName );
			
			if (playerName.length == 0) {
				outerBox.css({'display':'none'});
				return;
			}
			
			// DB에서 데이터 가져오기
			$.ajax({
				"url": "select-name",
				"method": "GET",
				"data": { "playerName": playerName }, // "id=" + id
				"dataType": "json",
				"success": function(data, status, xhr) {
					//console.log(data);
					//var ids = data.split(":");// 'a:b:c' -> ['a', 'b', 'c']
					if (data.length == 0) {
						outerBox.css({'display':'none'});
						return;
					}
					outerBox.empty(); // remove all child
					$.each(data, function(idx, playerName) {
						var idAndName = playerName.split(":");
						console.log(playerName);
						var innerBox = $('<div></div>');
						innerBox.text(idAndName[1])
								.css({ 'padding': '5px' })
								.on('mouseenter', function(event) {
									$(this).css({'background-color': 'yellow'})
								})
								.on('mouseleave', function(event) {
									$(this).css({'background-color': 'white'})
								})
								.on('click', function(event) {
									$('#nameInput').val( $(this).text() )
									$('#nameInput').attr('data-id', idAndName[0]);
									outerBox.css({'display' : 'none'})
								})
								.appendTo(outerBox);						
					});
					outerBox.css({ 'display': 'block' });
				},
				"error": function(xhr, status, err) {
					
				}
			});
			
	    })
  })
  
  function getTop() {
		var	t =	document.getElementById("nameInput");

		var	topPos = 2 + t.offsetHeight;//현재 요소의 높이
		while(t.tagName.toLowerCase() != "body" && 
			  t.tagName.toLowerCase() != "html") {
			topPos += t.offsetTop;//offsetTop : 상위 요소와의 y축 거리
			t = t.offsetParent;	//상위 요소를 현재 요소에 대입
		}
		return topPos;
	}
  
	function getLeft() {
		var	t =	document.getElementById("nameInput");

		var	leftPos	= 0;
		while(t.tagName.toLowerCase() != "body" && 
			  t.tagName.toLowerCase() != "html") {
			leftPos += t.offsetLeft;//t와 상위 요소 사이의 x축 거리
			t = t.offsetParent;//t의 부모 요소
		}
		return leftPos;
	}
	// 동일 이름 보여주기 -끝
	
	$(function() {
		$('#lnk-search').on('click', function(event) {
/* 			var player = $('#nameInput').val();
			if (player.length == 0) {
				alert('선수 이름을 입력하세요');
				return;
			} */
			var playerId = $('#nameInput').attr('data-id');
			if (!playerId) { 
				alert('선수이름을 입력해서 선택하세요');
				return;
			}
			location.href="/dashboard-web/show3?player=" + playerId;
		});
	});


</script>
</body>
</html>