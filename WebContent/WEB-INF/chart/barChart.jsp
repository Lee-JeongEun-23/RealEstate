<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-11">
<title>실거래 매매 평균가격</title>
<script src="https://www.chartjs.org/dist/2.9.2/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
$(function() { 
	
	console.log("난 탄다");
	let allData9 = [
		{code:11110, sum:0, count:0}, //종로구
		{code:11290, sum:0, count:0}, //성북구
		{code:11620, sum:0, count:0}, //관악구
		{code:11680, sum:0, count:0}, //강남구
		{code:11740, sum:0, count:0}, //강동구
		{code:11500, sum:0, count:0}  //강서구
	  ];
	let allData10 = [
		{code:11110, sum:0, count:0}, //종로구
		{code:11290, sum:0, count:0}, //성북구
		{code:11620, sum:0, count:0}, //관악구
		{code:11680, sum:0, count:0}, //강남구
		{code:11740, sum:0, count:0}, //강동구
		{code:11500, sum:0, count:0}  //강서구
	  ];
	let allData11 = [
		{code:11110, sum:0, count:0}, //종로구
		{code:11290, sum:0, count:0}, //성북구
		{code:11620, sum:0, count:0}, //관악구
		{code:11680, sum:0, count:0}, //강남구
		{code:11740, sum:0, count:0}, //강동구
		{code:11500, sum:0, count:0}  //강서구
	  ];	

	var j9 = 0; //9월 종로구 평균 거래금액
	var s9 = 0; //9월 성북구 평균 거래금액
	var g9 = 0; //9월 관악구 평균 거래금액
	var gn9 = 0; //9월 강남구 평균 거래금액
    var gd9 = 0; //9월 강동구 평균 거래금액      
    var gs9 = 0; //9월 강서구 평균 거래금액    

	var j10 = 0; //10월 종로구 평균 거래금액
	var s10 = 0; //10월 성북구 평균 거래금액
	var g10 = 0; //10월 관악구 평균 거래금액
	var gn10 = 0; //10월 강남구 평균 거래금액
    var gd10 = 0; //10월 강동구 평균 거래금액      
    var gs10 = 0; //10월 강서구 평균 거래금액        

	var j11 = 0; //11월 종로구 평균 거래금액
	var s11 = 0; //11월 성북구 평균 거래금액
	var g11 = 0; //11월 관악구 평균 거래금액
	var gn11 = 0; //11월 강남구 평균 거래금액
    var gd11 = 0; //11월 강동구 평균 거래금액      
    var gs11 = 0; //11월 강서구 평균 거래금액        
    
		$.ajax({
               url : 'Data.do',
               type : 'post',
               dataType : 'json',
               success : function(data) {        
            	
            	$.each(data, function(index, element) {

               let amount = element.response.body.items.item;
                console.log(element);
                
				$.each(amount, function(key, value){       
			        //9월달 데이터       
			        if(value.월=='9'&&(value.지역코드=='11110')){		               
			               allData9[0].sum += parseInt(value.거래금액.trim());
			               allData9[0].count ++;  
			        
			        }else if(value.월=='9'&&(value.지역코드=='11290')){		               
			               allData9[1].sum += parseInt(value.거래금액.trim());
			               allData9[1].count ++;  
			        
			        }else if(value.월=='9'&&(value.지역코드=='11620')){		               
			               allData9[2].sum += parseInt(value.거래금액.trim());
			               allData9[2].count ++;  
			        
			        }else if(value.월=='9'&&(value.지역코드=='11680')){		               
			               allData9[3].sum += parseInt(value.거래금액.trim());
			               allData9[3].count ++;  
			        
			        }else if(value.월=='9'&&(value.지역코드=='11740')){		               
			               allData9[4].sum += parseInt(value.거래금액.trim());
			               allData9[4].count ++;  
			        
			        }else if(value.월=='9'&&(value.지역코드=='11500')){		               
			               allData9[5].sum += parseInt(value.거래금액.trim());
			               allData9[5].count ++;  
			        
			        //10월달 데이터          
			        }else if(value.월=='10'&&(value.지역코드=='11110')){	
			               allData10[0].sum += parseInt(value.거래금액.trim());
			               allData10[0].count ++;  
			        
			        }else if(value.월=='10'&&(value.지역코드=='11290')){		               
			               allData10[1].sum += parseInt(value.거래금액.trim());
			               allData10[1].count ++;  
			        
			        }else if(value.월=='10'&&(value.지역코드=='11620')){		               
			               allData10[2].sum += parseInt(value.거래금액.trim());
			               allData10[2].count ++;  
			        
			        }else if(value.월=='10'&&(value.지역코드=='11680')){		               
			               allData10[3].sum += parseInt(value.거래금액.trim());
			               allData10[3].count ++;  
			        
			        }else if(value.월=='10'&&(value.지역코드=='11740')){		               
			               allData10[4].sum += parseInt(value.거래금액.trim());
			               allData10[4].count ++;  
			        
			        }else if(value.월=='10'&&(value.지역코드=='11500')){		               
			               allData10[5].sum += parseInt(value.거래금액.trim());
			               allData10[5].count ++;  
			        
			        //11월달 데이터
			        }else if(value.월=='11'&&(value.지역코드=='11110')){		               
			               allData11[0].sum += parseInt(value.거래금액.trim());
			               allData11[0].count ++;  
			               
			        }else if(value.월=='11'&&(value.지역코드=='11290')){		               
			               allData11[1].sum += parseInt(value.거래금액.trim());
			               allData11[1].count ++;  
			               
			        }else if(value.월=='11'&&(value.지역코드=='11620')){		               
			               allData11[2].sum += parseInt(value.거래금액.trim());
			               allData11[2].count ++;  
			               
			        }else if(value.월=='11'&&(value.지역코드=='11680')){		               
			               allData11[3].sum += parseInt(value.거래금액.trim());
			               allData11[3].count ++;  
			               
			        }else if(value.월=='11'&&(value.지역코드=='11740')){		               
			               allData11[4].sum += parseInt(value.거래금액.trim());
			               allData11[4].count ++;  
			               
			        }else if(value.월=='11'&&(value.지역코드=='11500')){		               
			               allData11[5].sum += parseInt(value.거래금액.trim());
			               allData11[5].count ++;  
			        } 

				});

            	});  

				  //9월 평균
				  j9 = (allData9[0].sum/allData9[0].count).toFixed(2); 

				  s9 = (allData9[1].sum/allData9[1].count).toFixed(2); 

				  g9 = (allData9[2].sum/allData9[2].count).toFixed(2); 

				  gn9 = (allData9[3].sum/allData9[3].count).toFixed(2); 

				  gd9 = (allData9[4].sum/allData9[4].count).toFixed(2); 

				  gs9 = (allData9[5].sum/allData9[5].count).toFixed(2); 

				  //10월 평균
				  j10 = (allData10[0].sum/allData10[0].count).toFixed(2); 

				  s10 = (allData10[1].sum/allData10[1].count).toFixed(2); 

				  g10 = (allData10[2].sum/allData10[2].count).toFixed(2); 

				  gn10 = (allData10[3].sum/allData10[3].count).toFixed(2); 

				  gd10 = (allData10[4].sum/allData10[4].count).toFixed(2); 

				  gs10 = (allData10[5].sum/allData10[5].count).toFixed(2); 
				  	            	
            	  //11월 평균
				  j11 = (allData11[0].sum/allData11[0].count).toFixed(2);

				  s11 = (allData11[1].sum/allData11[1].count).toFixed(2); 

				  g11 = (allData11[2].sum/allData11[2].count).toFixed(2); 

				  gn11 = (allData11[3].sum/allData11[3].count).toFixed(2); 

				  gd11 = (allData11[4].sum/allData11[4].count).toFixed(2); 

				  gs11 = (allData11[5].sum/allData11[5].count).toFixed(2); 		
				  
				  
				 barchart();	
					
               }
                  
                  
          }); //ajax 닫기
       
          
        function barchart(){ 
        var MONTHS = ['종로구', '성북구', '관악구', '강남구', '강동구', '강서구'];
 		var color = Chart.helpers.color;
 		var barChartData = {
 			labels: ['종로구', '성북구', '관악구', '강남구', '강동구', '강서구'],
 			
 			datasets: [{
 				label: '9월 평균 거래금액',
 				backgroundColor: color(window.chartColors.yellow).alpha(0.5).rgbString(),
 				borderColor: window.chartColors.yellow,
 				borderWidth: 1,
 				data: [j9, s9, g9, gn9, gd9, gs9]
 			}, {
 				label: '10월 평균 거래금액',
 				backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
 				borderColor: window.chartColors.green,
 				borderWidth: 1,
 				data: [j10, s10, g10, gn10, gd10, gs10]		
 			}, {
 				label: '11월 평균 거래금액',
 				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
 				borderColor: window.chartColors.red,
 				borderWidth: 1,
 				data: [j11, s11, g11, gn11, gd11, gs11]
 			}]

 		};

			var ctx = document.getElementById('canvas1').getContext('2d');
 			window.myBar = new Chart(ctx, {
 				type: 'bar',
 				data: barChartData,
 				options: {
 					responsive: true,
 					legend: {
 						position: 'top',
 					},
 					title: {
 						display: true,
 						text: '서울시 대표 6개 구의 실거래 매매 평균치 (단위 : 백만 원)'
 					}
 				}
 			});

      }
  }); 
</script>
</head>
<body>
<div id="container" style="width: 100%;">
		<canvas id="canvas1"></canvas>
	</div>
</body>
</html>