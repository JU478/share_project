<%@page import="com.dashboardweb.vo.NjyTableVO"%>
<%@page import="org.apache.catalina.tribes.membership.MemberImpl"%>
<%@page import="com.dashboardweb.vo.NjyMemberVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NJY DEMO</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/dashboard-web2/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/dashboard-web2/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<div class="wrapper">

		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
		<!--  이미 만들어진 페이지를 재사용하기위하여 사용 -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
													<%
						NjyMemberVo member = (NjyMemberVo) request.getAttribute("memberInfo");
					%>
						<div class="col-sm-6">
							<h1><%=member.getPlayerName()%> 선수 정보</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
						
								<li class="breadcrumb-item active"><%=member.getPlayerName()%>&nbsp;선수 정보</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">다른 선수 보기</h3>

									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 300px;">
											<input type="text" id="nameInput" name="playerSearch"
												class="form-control float-right" placeholder="Search">

											<div class="input-group-append">
												<button id="lnk-search" type="submit"
													class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- /.row -->

					</div>
					<!-- /.container-fluid -->
			</section>

			<!-- 선수사진 들어갈 자리  -->
			<section class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-12">
							<div class="card card-primary card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle"
											src="https://lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/person/middle/2020/<%=member.getPlayerId()%>.jpg"
											alt="Player profile picture">
									</div>

									<h3 class="profile-username text-center"><%=member.getPlayerName()%></h3>

									<p class="text-muted text-center"><%=member.getTeamName()%>
										/
										<%=member.getPosition()%></p>
									<p class="text-muted text-center">
										신장 :
										<%=member.getHeight()%>
										/ 체중 :
										<%=member.getWeight()%>
										/ 생년월일 :
										<%=member.getBirthDate()%></p>

									<!-- <a id="playerDetail" href="#" class="btn btn-primary btn-block"><b>상세 정보 보기</b></a>  -->
								</div>
							</div>
							<!-- /.card-body -->
							<!-- 상단 오른쪽 -->
						</div>





					</div>
				</div>
			</section>
			<!-- 선수사진 들어갈 자리 -->

			<!-- 그래프 들어갈 자리 -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">

						<!-- /.col -->

						<div class="col-md-12">
							<!-- Bar chart -->
							<div class="card card-primary card-outline">
								<div class="card-header">
									<h3 class="card-title">
										<i class="far fa-chart-bar"></i><b>&nbsp;2021년 연봉 예측</b> 
									</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-card-widget="remove">
											<i class="fas fa-times"></i>
										</button>
									</div>
								</div>
								<div class="card-body">
									<div class="chart">
									<canvas id="barChart"
										style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;">

									</canvas>
									</div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->


							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<div class="row">
					<div class="col-md-12">
					<div class="card card-primary card-outline">
					<div class="card-header">
									<h3 class="card-title">
										<b>&nbsp;2020년 성적</b> 
									</h3>
					<div id="iris-container" class="card-body table-responsive p-0"
						style="height: 300px;">
						<table class="table table-head-fixed text-nowrap">
							<thead>
								<tr>
									<th>ID</th>
									<th>HEIGTH</th>
									<th>WEIGTH</th>
									<th>AGE</th>
									<th>GP</th>
									<th>CG</th>
									<th>SO</th>
									<th>GS</th>
									<th>W</th>
									<th>L</th>
									<th>SV</th>
									<th>HLD</th>
									<th>IP</th>
									<th>ER</th>
									<th>BF</th>
									<th>H</th>
									<th>B2</th>
									<th>B3</th>
									<th>HR</th>
									<th>BB</th>
									<th>IBB</th>
									<th>HBP</th>
									<th>K</th>
									<th>BK</th>
									<th>WP</th>
									<th>ERA</th>
									<th>FIP</th>
									<th>WHIP</th>
									<th>ERA_PLUS</th>
									<th>FIP_PLUS</th>
									<th>WAR</th>
									<th>WAP</th>
									<th>SALARY</th>
								</tr>
							</thead>
							<tbody>
								<%
									NjyTableVO[] tableData = (NjyTableVO[]) request.getAttribute("table-data");
								%>
								<%
									for (NjyTableVO data : tableData) {
								%>
								<tr>
									<td><%=data.getID()%></td>
									<td><%=data.getHEIGTH()%></td>
									<td><%=data.getWEIGTH()%></td>
									<td><%=data.getAGE()%></td>
									<td><%=data.getGP()%></td>
									<td><%=data.getCG()%></td>
									<td><%=data.getSO()%></td>
									<td><%=data.getGS()%></td>
									<td><%=data.getW()%></td>
									<td><%=data.getL()%></td>
									<td><%=data.getSV()%></td>
									<td><%=data.getHLD()%></td>
									<td><%=data.getIP()%></td>
									<td><%=data.getER()%></td>
									<td><%=data.getBF()%></td>
									<td><%=data.getH()%></td>
									<td><%=data.getB2()%></td>
									<td><%=data.getB3()%></td>
									<td><%=data.getHR()%></td>
									<td><%=data.getBB()%></td>
									<td><%=data.getIBB()%></td>
									<td><%=data.getHBP()%></td>
									<td><%=data.getK()%></td>
									<td><%=data.getBK()%></td>
									<td><%=data.getWP()%></td>
									<td><%=data.getERA()%></td>
									<td><%=data.getFIP()%></td>
									<td><%=data.getWHIP()%></td>
									<td><%=data.getERA_PLUS()%></td>
									<td><%=data.getFIP_PLUS()%></td>
									<td><%=data.getWAR()%></td>
									<td><%=data.getWAP()%></td>
									<td><%=data.getSALARY()%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
							
					</div>
					</div>
					</div>
					</div>
					</div>
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
				</div>
			</section>


			<!-- /.content-wrapper -->

	

		</div>
		<!-- ./wrapper -->
	</div>
	
		<!-- jQuery -->
		<script src="/dashboard-web/plugins/jquery/jquery.min.js"></script>
		<!-- Bootstrap 4 -->
		<script src="/dashboard-web/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- ChartJS -->
		<script src="/dashboard-web/plugins/chart.js/Chart.min.js"></script>
		<!-- AdminLTE App -->
		<script src="/dashboard-web/dist/js/adminlte.min.js"></script>		
		<!-- AdminLTE for demo purposes -->
		<script src="/dashboard-web/dist/js/demo.js"></script>

		<script>
			// 동일 이름 보여주기 -시작
			$(function() {

				$.ajax({
			     	"url": "njy-chart-data",
			     	"method": "get",
			     	"data": 'player=<%= request.getParameter("player") %>',
			     	"dataType": "json",
			     	"success": function(data, status, xhr) {

					    var areaChartData = {
					      labels  : data.labels,
					      datasets: [
					        {
					          label               : '단위 : 만원',
					          backgroundColor     : 'rgba(60,141,188,0.9)',
					          borderColor         : 'rgba(60,141,188,0.8)',
					          pointRadius          : false,
					          pointColor          : '#3b8bba',
					          pointStrokeColor    : 'rgba(60,141,188,1)',
					          pointHighlightFill  : '#fff',
					          pointHighlightStroke: 'rgba(60,141,188,1)',
					          data                : data.datasets[0]
					        },
					      ]
					    }
					
					    //-------------
					    //- BAR CHART -
					    //-------------
					    var barChartCanvas = $('#barChart').get(0).getContext('2d')
					    var barChartData = $.extend(true, {}, areaChartData)
					    var temp0 = areaChartData.datasets[0]
					    barChartData.datasets[0] = temp0
					
					    var barChartOptions = {
					      responsive              : true,
					      maintainAspectRatio     : false,
					      datasetFill             : false
					    }
					
					    var barChart = new Chart(barChartCanvas, {
					      type: 'bar',
					      data: barChartData,
					      options: barChartOptions
					    })
			     	},
			     	"error": function(xhr, status, err) {
			    		console.log(err.message);
			    	}
			     })
					
					
				// 선수검색

				var outerBox = $('<div></div>');
				outerBox.css({
					"border" : "solid 1px",
					"background-color" : "white",
					"width" : "300px",
					"display" : "none",
					"position" : "absolute",
					"left" : getLeft(),
					"top" : getTop()
				});
				outerBox.appendTo("body"); // $('body').append(outerBox)

				$('body').on('click', function(event) {
					outerBox.css({
						'display' : 'none'
					})
				});

				$('#nameInput').on(
						'keyup',
						function(event) {
							var playerName = $(this).val();
							console.log(playerName);

							if (playerName.length == 0) {
								outerBox.css({
									'display' : 'none'
								});
								return;
							}

							// DB에서 데이터 가져오기
							$.ajax({
								"url" : "select-name",
								"method" : "GET",
								"data" : {
									"playerName" : playerName
								}, // "id=" + id
								"dataType" : "json",
								"success" : function(data, status, xhr) {
									//console.log(data);
									//var ids = data.split(":");// 'a:b:c' -> ['a', 'b', 'c']
									if (data.length == 0) {
										outerBox.css({
											'display' : 'none'
										});
										return;
									}
									outerBox.empty(); // remove all child
									$.each(data, function(idx, playerName) {
										var idAndName = playerName.split(":");
										console.log(playerName);
										var innerBox = $('<div></div>');
										innerBox.text(idAndName[1]).css({
											'padding' : '5px'
										}).on('mouseenter', function(event) {
											$(this).css({
												'background-color' : 'yellow'
											})
										}).on('mouseleave', function(event) {
											$(this).css({
												'background-color' : 'white'
											})
										}).on(
												'click',
												function(event) {
													$('#nameInput').val(
															$(this).text())
													$('#nameInput').attr(
															'data-id',
															idAndName[0]);
													outerBox.css({
														'display' : 'none'
													})
												}).appendTo(outerBox);
									});
									outerBox.css({
										'display' : 'block'
									});
								},
								"error" : function(xhr, status, err) {

								}
							});

						})
			})

			function getTop() {
				var t = document.getElementById("nameInput");

				var topPos = 2 + t.offsetHeight;//현재 요소의 높이
				while (t.tagName.toLowerCase() != "body"
						&& t.tagName.toLowerCase() != "html") {
					topPos += t.offsetTop;//offsetTop : 상위 요소와의 y축 거리
					t = t.offsetParent; //상위 요소를 현재 요소에 대입
				}
				return topPos;
			}

			function getLeft() {
				var t = document.getElementById("nameInput");

				var leftPos = 0;
				while (t.tagName.toLowerCase() != "body"
						&& t.tagName.toLowerCase() != "html") {
					leftPos += t.offsetLeft;//t와 상위 요소 사이의 x축 거리
					t = t.offsetParent;//t의 부모 요소
				}
				return leftPos;
			}
			// 동일 이름 보여주기 -끝
			$(function() {
				$('#lnk-search').on('click', function(event) {

					var playerId = $('#nameInput').attr('data-id');
					if (!playerId) {
						alert('선수이름을 입력해서 선택하세요');
						return;
					}
					location.href = "/dashboard-web/show3?player=" + playerId;
				});
			});
		</script>
</body>
</html>