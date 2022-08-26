<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"> -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="../../js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<style>
.glyphicon {
	margin-right: 4px !important; /*override*/
}

.pagination .glyphicon {
	margin-right: 0px !important; /*override*/
}

.pagination a {
	color: #555;
}

.panel ul {
	padding: 0px;
	margin: 0px;
	list-style: none;
}

.news-item {
	padding: 4px 4px;
	margin: 0px;
	border-bottom: 1px dotted #555;
}
</style>
<script>
	$(function() {
		$.ajax({
			url : 'news.do',
			dataType : 'json',
			type : 'post',
			success : function(data) {
				$.each(data, function(index, element) {
					var items = element.items;
					$.each(items, function(index, element) {
						console.log(element.title);
						console.log(element.link);
						var table = "<li class='news-item'>";
						table +="<table cellpadding='4'>";
						table +="<tr>";
						table +="<td>"+ element.title;
						table +="<a href="+"'"+element.link+"'>Read More..</a></td>";
						table +="</tr>";
						table +="</table>";
						table +="</li>";
						$("#newsbox").append(table);
					});
				})
			}
		}); //ajax

		$(".demo").bootstrapNews({
			newsPerPage : 4,
			navigation : true,
			autoplay : true,
			direction : 'up', // up or down
			animationSpeed : 'normal',
			newsTickerInterval : 4000, //4 secs
			pauseOnHover : true,
			onStop : null,
			onPause : null,
			onReset : null,
			onPrev : null,
			onNext : null,
			onToDo : null
		});
	});
</script>
</head>
<body>
<div class="col-lg-12" style="padding:0;margin-top:35px;margin-right:0px;">
		<br><div class="col-md-offset-2 col-md-12">
			<div class="col-lg-9">
				<div class="panel panel-default">
					<div class="panel-heading panel1">
					<i class="far fa-newspaper fa-2x"></i>&nbsp;&nbsp;네이버 부동산 블로그 뉴스
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12">
								<ul class="demo1" id="newsbox">
								</ul>
							</div>
						</div>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>