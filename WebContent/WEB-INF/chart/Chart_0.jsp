<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>실거래가 지수</title>
<script src="https://www.chartjs.org/dist/2.9.2/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>
<script type="text/javascript">
$(function() {
	   
	   var isShow = true;
	   var xCategories = [];
	   

	   var microData = []; //초소형
	   var smallData = []; //소형
	   var middleData = []; //중형
	   var middleBigData = []; //중대형
	   var bigData = []; //대형
	      $.ajax({
	            url : 'PublicData.do',
	            type : 'post',
	            dataType : 'json',
	            success : function(data) {
	             let arrTest=[];
	             let arr1 = [];
	           
	              let test = [];
	               $.each(data, function(index, element) {
	                  let rsRow = element.response.body.item.rsRow;
	                  let sizeNm = element.response.body.item.sizeNm; //소형 초소형 같은 분류
	                  let rsRow2 = [];
	                  console.log(index);
	                 
	                rsRow2= rsRow.split(",");
	                   
	               for(var i=1; i<rsRow2.length; i+=2){
	                  arrTest.push(rsRow2[i]);
	                 }
	               });
	               for(i=0; i<8; i++){
	                  microData.push(parseInt(arrTest[i]));
	               }
	               for(i=7; i<16; i++){
	                  smallData.push(parseInt(arrTest[i]));
	               }
	               for(i=14; i<24; i++){
	                  middleData.push(parseInt(arrTest[i]));
	               }
	               for(i=21; i<32; i++){
	                  middleBigData.push(parseInt(arrTest[i]));
	               }
	               for(i=28; i<40; i++){
	                  bigData.push(parseInt(arrTest[i]));
	               }
	               
	               setHighChart();
	            }

	        }); //ajax 닫기

	        function setHighChart(){
			var lineChartData = {

				labels : ['2019.01', '2019.02', '2019.03', '2019.04',
						'2019.05', '2019.06', '2019.07', '2019.08'],
				datasets : [{
					label : '초소형(24평 미만)',
					borderColor : window.chartColors.red,
					backgroundColor : window.chartColors.red,
					fill : false,
					data : microData,
					yAxisID : 'y-axis-1',
				}, {
					label : '소형(24평)',
					borderColor : window.chartColors.blue,
					backgroundColor : window.chartColors.blue,
					fill : false,
					data : smallData,
					yAxisID : 'y-axis-1'
				}, {
					label : '중소형(32평 미만)',
					borderColor : window.chartColors.green,
					backgroundColor : window.chartColors.green,
					fill : false,
					data : middleData,
					yAxisID : 'y-axis-1'
				}, {
					label : '중대형(32평)',
					borderColor : window.chartColors.yellow,
					backgroundColor : window.chartColors.yellow,
					fill : false,
					data : middleBigData,
					yAxisID : 'y-axis-1'
				}, {
					label : '대형(32평 초과)',
					borderColor : window.chartColors.purple,
					backgroundColor : window.chartColors.purple,
					fill : false,
					data : bigData,
					yAxisID : 'y-axis-1'
				} ]
			};

			var ctx = document.getElementById('canvas0').getContext('2d');
			window.myLine = Chart.Line(ctx, {
				data : lineChartData,
				options : {
					responsive : true,
					hoverMode : 'index',
					stacked : false,
					title : {
						display : true,
						text : '서울시 아파트 매매 실거래 가격 지수'
					},
					scales : {
						yAxes : [ {
							type : 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
							display : true,
							position : 'left',
							id : 'y-axis-1',
					        ticks: {
					            beginAtZero: true,
					            min: 100,
					            max: 130
					          },
							// grid line settings
							gridLines : {
								drawOnChartArea : false, // only want the grid lines for one axis to show up
							},
						} ],
					}
				}
			});
	     }
	});
</script>
</head>
<body>
	<div style="width: 100%;">
		<canvas id="canvas0"></canvas>
	</div>

</body>
</html>