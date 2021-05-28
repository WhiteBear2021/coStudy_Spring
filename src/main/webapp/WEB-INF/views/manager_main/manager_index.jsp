<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="../managerModule/head.jsp"></jsp:include><hr>


<jsp:include page="../managerModule/header.jsp"></jsp:include><hr>
<body class="">
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- [ breadcrumb ] start -->
			<div class="page-header">
				<div class="page-block">
					<div class="row align-items-center">
						<div class="col-md-12">
							<div class="page-header-title">
								<h5 class="m-b-10">Manager main</h5>
							</div>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i
										class="feather icon-home"></i></a></li>
								<li class="breadcrumb-item"><a href="#!">Main</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- [ breadcrumb ] end -->
			<!-- [ Main Content ] start -->
			<div class="row">


				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h5>회원별 관심 카테고리</h5>
						</div>
						<div class="card-body">
							<div id="pie-chart-1" style="width: 100%"></div>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h5>스터디그룹별 카테고리</h5>
						</div>
						<div class="card-body">
							<div id="pie-chart-2" style="width: 100%"></div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h5>일별 회원가입 현황 </h5>
						</div>
						<div class="card-body">
							<div id="area-chart-1"></div>
						</div>
					</div>
				</div> 


			</div>
			<!-- [ Main Content ] end -->
		</div>
	</div>
</body>
<jsp:include page="../managerModule/footer.jsp"></jsp:include>

<!--스터디 그룹별(카테고리)  -->
<script type="text/javascript">
	$(function() {
		var scs = ${studygroup_Category_Sta};
		var options = {
			chart : {
				height : 320,
				type : 'donut',
			},
			labels : [ 'IT', '외국어', '취업', '자격증', '전공', '수험생' ],
			series : [ scs[0], scs[1], scs[2], scs[3], scs[4], scs[5] ],
			colors : [ "#4680ff", "#0e9e4a", "#00acc1", "#ffba57", "#ff5252",
					"#8B00FF" ],
			legend : {
				show : true,
				position : 'bottom',
			},
			plotOptions : {
				pie : {
					donut : {
						labels : {
							show : true,
							name : {
								show : true
							},
							value : {
								show : true
							}
						}
					}
				}
			},
			dataLabels : {
				enabled : true,
				dropShadow : {
					enabled : false,
				}
			},
			responsive : [ {
				breakpoint : 480,
				options : {
					legend : {
						position : 'bottom'
					}
				}
			} ]
		}
		var chart = new ApexCharts(document.querySelector("#pie-chart-2"),
				options);
		chart.render();
	});
</script>
<!--user_category_sta 통걔부분  -->
<script type="text/javascript">
	$(function() {

		var ucs = ${user_category_sta};

		var options = {
			chart : {
				height : 320,
				type : 'pie',
			},
			labels : [ 'IT', '외국어', '취업', '자격증', '전공', '수험생' ],
			series : [ ucs[0], ucs[1], ucs[2], ucs[3], ucs[4], ucs[5] ],
			colors : [ "#4680ff", "#0e9e4a", "#00acc1", "#ffba57", "#ff5252",
					"#8B00FF" ],
			legend : {
				show : true,
				position : 'bottom',
			},
			dataLabels : {
				enabled : true,
				dropShadow : {
					enabled : false,
				}
			},
			responsive : [ {
				breakpoint : 480,
				options : {
					legend : {
						position : 'bottom'
					}
				}
			} ]
		}
		var chart = new ApexCharts(document.querySelector("#pie-chart-1"),
				options);
		chart.render();
	});
</script>
<script type="text/javascript">
$(function() {
 	 var list=${list};
 	 
	 console.log(list[0].cnt); 
/* 	console.log("////////////////////////////////");
    var uns=${user_New_Sta};
   
    console.log("////////////////////////////////");
    console.log(uns); */
    
	var options = {
        chart: {
            height: 350,
            type: 'area',
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'smooth'
        },
        colors: ["#ff5252"],
        series: [{
            name: '회원수',
            data: [list[0].cnt, list[1].cnt, list[2].cnt, list[3].cnt, list[4].cnt]
        }],

        xaxis: {
            type: 'datetime',
            categories: [list[0].user_register_date, list[1].user_register_date, list[2].user_register_date, list[3].user_register_date, list[4].user_register_date],
        },
        tooltip: {
            x: {
                format: 'yyyy/MM/dd'
            },
        }
    }

    var chart = new ApexCharts(
        document.querySelector("#area-chart-1"),
        options
    );

    chart.render();
});

</script> 

</html>