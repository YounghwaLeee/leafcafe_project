<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출현황</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<style>
	/* 전체선택 */
	ul,li{list-style:none; padding:0px;}
	html,body{margin:0px; padding:0px;}
	body{background:#f3EAEA;}
	/*-----*/
 
/* 사이드 메뉴------------------------------------------------------------------------------------ */
	@import url(https://fonts.googleapis.com/css?family=Titillium+Web:300);
	.fa-2x {font-size: 2em;}
	.fa {position: relative; display: table-cell; width: 60px; height: 36px; text-align: center; vertical-align: middle; font-size:20px;}
	.main-menu:hover,nav.main-menu.expanded {width:250px; overflow:visible;}
	.main-menu {background:#212121; border-right:1px solid #e5e5e5; position:absolute; top:0; bottom:0; height:100%;left:0;width:60px;overflow:hidden;-webkit-transition:width .05s linear;
	transition:width .05s linear; -webkit-transform:translateZ(0) scale(1,1); z-index:1000;}
	.main-menu>ul {margin:7px 0;}
	.main-menu li {position:relative; display:block; width:250px;}
	.main-menu li>a {position:relative; display:table; border-collapse:collapse; border-spacing:0; color:#999; font-family: arial; font-size: 14px; text-decoration:none;
	-webkit-transform:translateZ(0) scale(1,1); -webkit-transition:all .1s linear; transition:all .1s linear;}
	.main-menu .nav-icon {position:relative; display:table-cell; width:60px; height:36px; text-align:center; vertical-align:middle; font-size:18px;}
	.main-menu .nav-text {position:relative; display:table-cell; vertical-align:middle; width:190px; font-family: 'Titillium Web', sans-serif;}
	.main-menu>ul.logout {position:absolute; left:0; bottom:0;}
	.no-touch .scrollable.hover {overflow-y:hidden;}
	.no-touch .scrollable.hover:hover {overflow-y:auto; overflow:visible;}
	a:hover,a:focus {text-decoration:none;}
	nav {-webkit-user-select:none; -moz-user-select:none; -ms-user-select:none; -o-user-select:none; user-select:none;}
	nav ul,nav li {outline:0; margin:0; padding:0;}
	.main-menu li:hover>a,nav.main-menu li.active>a,.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus,.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus,.no-touch .dashboard-page nav.dashboard-menu ul li:hover a,.dashboard-page nav.dashboard-menu ul li.active a {
	color:#fff; background-color:#5fa2db;}
	.area {float: left; background: #e2e2e2; width: 100%; height: 100%;}
	@font-face {font-family: 'Titillium Web'; font-style: normal; font-weight: 300; src: local('Titillium WebLight'), local('TitilliumWeb-Light'), url(http://themes.googleusercontent.com/static/fonts/titilliumweb/v2/anMUvcNT0H1YN4FII8wpr24bNCNEoFTpS2BTjF6FB5E.woff) format('woff');}
	
	.sideChartWriteName{position:absolute; width:200px; font-size:1.1rem; top:220px; left:-10px; color:#009E97; font-weight:600; text-align:center;}
	.sideChartWriteGa{position:absolute; width:200px; font-size:1.1rem; top:220px; left:180px; font-weight:600;}
	.sideChartWriteDocu{position:absolute; width:250px; font-size:1rem; top:250px; left:-30px;}
/* ------------------------------------------------------------------------------------------ */
	
/*  바디부 -------------------------------------*/
	/* 상단 알림바*/
	.topmain{margin:40px auto; width:1600px; position:relative;}
	.topbox{display:flex; width:900px; justify-content: space-between;}
	.nav-box{ box-sizing: border-box; border-radius: 4px; height:150px; width:200px; text-align:center; padding:20px; background:#fff;}
	.nav-box h2{color:rgb(0,163,239);}
	
	
	/* --------------*/
	/* 사이드 파이 차트*/
	.sidePieChartDiv{position:absolute; top:407px; left: 1140px; width:385px; height:350px; background:#fff; box-sizing: border-box; border-radius: 4px;}
	.pie-chart{position: relative; display:inline-block; width:200px; height:200px; border-radius: 50%; transition: 0.3s; left:95px; top:20px;}
	span.sidePieChartCenter{background:#fff; display : block; position: absolute; top:50%; left:50%; width:160px; height:160px; border-radius: 50%; text-align:center; line-height:160px; font-size:30px; transform: translate(-50%, -50%);}
	
	
	/* --------------*/
	.datechoicelabel{display:inline-block; position: absolute; width:250px; height:100px; margin-left:123px;}
	.datechoicelabel span{position:absolute; font-size:1.7em; top:27px; left:133px;}
	.datechoicelabel:after{content: ''; display: inline-block;height: 100px; border-left: 2px solid #777; margin-left: 300px;}
	.choiceDateMain{margin:0 auto; width:1600px;}
	.choiceDateDiv{display:inline-block; width:900px; padding:0px 0px 30px 0px; background:#fff; box-sizing: border-box; border-radius: 4px;}
	.choiceDateDiv h4{text-align:center;}
	
	#sdate{ cursor:pointer;}
	#edate{ cursor:pointer;}
	.dateul{overflow:auto; height:50px; margin-left:155px;}	
	.dateul li{float:left; margin-left:20px;}
	.dateul input[type=radio]{position:absolute;z-index:-1}
	.dateboxlabel{display:block;width:72px;height:26px;font-size:14px;font-weight:bold;color:#fff;text-align:center;line-height:25px;text-decoration:none;cursor:pointer;background:#a5b0b6;}
	.dateformdiv{margin-left:175px;}
	#dateSearchBtn{margin-left: 20px; height: 30px; box-sizing: border-box; border-radius: 4px; border: 0px; width:80px;background: rgb(0,163,239); color:#fff}
	#choiceOption{width:100px; height:30px; box-sizing: border-box; border-radius: 4px; margin-left:10px;}
	.dateform{width:195px; text-align:center; height:20px;}
	#dateViewBtn{width:100px; background:rgb(0,163,239); color:white; font-weight:500; height:26px; box-sizing: border-box; border:0px solid; cursor:pointer;}
	.dateChecked{display:block;width:72px;height:26px;font-size:14px;font-weight:bold;color:#fff;text-align:center;line-height:25px;text-decoration:none;cursor:pointer;background:rgb(0,163,239);}	
	.dateUnChecked{display:block;width:72px;height:26px;font-size:14px;font-weight:bold;color:#fff;text-align:center;line-height:25px;text-decoration:none;cursor:pointer;background:#a5b0b6;}
	
	
	.maindiv{width:1600px; margin:30px auto;}
	.searchDiv{height:40px; position:absolute; left:1080px; top:20px; z-index:1;}
	.searchDiv input[value=Search]{cursor:pointer;border: 0 solid; box-sizing: border-box; background: lightgray; color: white; font-weight: bold; position: absolute; left: 250px;}
	.searchDiv input{box-sizing: border-box; border-radius: 4px; height:35px; width:100px; border:1px solid gray;}
	.searchDiv input[type=text]{width:240px; border:1px solid gray; text-align:center;}
	.searchDiv input[type=button]{width:100px; border:1px solid gray; margin-left:10px; cursor:pointer;}
	.salesDiv{width:600px; display:inline-block; border-radius: 4px; position:absolute; left:925px; height:377px; top:0px; background:#fff;}
	.salesList{overflow:auto; width:95%; margin:70px auto 3px auto;}
	.salesList>li{float:left; width:20%; text-align:center; border-bottom:1px solid gray; height:50px; line-height:50px; font-size:1.08rem;}
	.salesList>li:nth-child(1){width:10%;}
	.salesList>li:nth-child(2){width:30%;}
	.salesList>li:nth-child(4){width:40%;}
	
	.salesRankList{overflow:auto; width:95%; margin:0 auto 10px auto; min-height:70px;}
	.salesRankList>li{float:left; height:40px; line-height:40px; text-align:center; font-size:0.9rem;}
	.salesRankList>li:nth-child(4n+1){width:10%;}
	.salesRankList>li:nth-child(4n+2){width:30%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; text-overflow:ellipsis;}
	.salesRankList>li:nth-child(4n+3){width:20%;}
	.salesRankList>li:nth-child(4n+4){width:40%;}
	
	/* 차트*/
	.chartbox{box-sizing: border-box; border-radius: 4px; width:1100px; height:350px; display:inline-block; padding-top:20px; background:#fff;}
	/* ----*/
	
/* 페이징 ----------------------------------------------------*/
	
	.page_wrap {text-align:center; font-size:0; height:30px; margin-top: 20px;}
	.page_nation {width:100%; display:flex;justify-content: center;}
	.page_nation a {display:block; margin:0 3px; float:left; border:1px solid #e6e6e6; width:28px;
					height:28px; line-height:28px; text-align:center; background-color:#fff; font-size:13px;
					color:#999999; text-decoration:none;}
	.page_nation .arrow {border:1px solid #ccc;}
	.page_nation .pprev {background:#f8f8f8 url('img/page_pprev.png') no-repeat center center; margin-left:0;}
	.page_nation .prev {background:#f8f8f8 url('img/page_prev.png') no-repeat center center; margin-right:7px;}
	.page_nation .next {background:#f8f8f8 url('img/page_next.png') no-repeat center center; margin-left:7px;}
	.page_nation .nnext {background:#f8f8f8 url('img/page_nnext.png') no-repeat center center; margin-right:0;}
	.page_nation a.active {background-color:#42454c; color:#fff; border:1px solid #42454c;}
/*--------------------------------------------------------------*/	
	/* 기간조회시 데이터가 없을경우*/
	.noDataMainChart{height:250px; display:flex; align-items:center; justify-content:center;}
	.noDataSideChart{height:340px; display:flex; align-items:center; justify-content:center; position:absolute; top:-19px; background:white; width:380px; left:3px; z-index:1;}
	.noDataList{height:370px; display:flex; align-items:center; justify-content:center; position:absolute; top:-16px; left:3px; background:white; width:590px; z-index:1;}
/*--------------------------------------------------------------*/	
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> 
<script>

	let defaultdate ="";
	let chartLabels = []; // 차트범례
	let chartData = []; // 차트 x축 데이터
	
	function priceToString(price) { // ,정규식
	    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	// 사이드 그래프
	function draw(percent, classname, colorname){
		   let i=1;
		   let func1 = setInterval(function(){
		      if(i<percent){
		    	  chartColor(i,classname,colorname);
		          i++;
		      } else{
		        clearInterval(func1);
		      }
		    },8);
		}
	function chartColor(i, classname,colorname){
	   $(classname).css({
	        "background":"conic-gradient("+colorname+" 0% "+i+"%, #ddd "+i+"% 100%)"
	   });
	}
	
	function sideChartreplay(percent){
		draw(percent, '.sidePieChart', '#009E97');
	}

	function replyChart(){			
		// 그래프 그리기
		 var context = document.getElementById('myChart').getContext('2d');
		 	
	        var myChart = new Chart(context, {
	            type: 'bar', // 차트의 형태
	            data: { // 차트에 들어갈 데이터
	                labels: chartLabels,
	                datasets: [
	                    { //데이터
	                        label: '전체매출순위', //차트 제목
	                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                        data: chartData,
	                        backgroundColor: [
	                            //색상
	                            '#009E97',
	                            '#008346',
	                            '#3D9028',
	                            '#839902',
	                            '#C29C00',
	                            '#FF9933',
	                            '#FA6E68',
	                            '#CD5F8E',
	                            '#8A5E97',
	                            '#4B5881'
	                            
	                        ],
	                        borderColor: [
	                            //경계선 색상
	                        	'#009E97',
	                            '#008346',
	                            '#3D9028',
	                            '#839902',
	                            '#C29C00',
	                            '#FF9933',
	                            '#FA6E68',
	                            '#CD5F8E',
	                            '#8A5E97',
	                            '#4B5881'
	                        ],
	                        borderWidth: 1 //경계선 굵기
	                    }
	                ]
	            }, // data
	            options: {
	            	legend:{
	            		display:false
	            	},
	            	responsive: false,
	                scales: {
	                    yAxes: [{
	                        gridLines:{
	                        	borderDash:[1,5],
	                        },
	                    	ticks: {
	                        	beginAtZero: true,
	                        	userCallback:function(value,index,values){
	                        		value = value.toString();
	                        		value = value.split(/(?=(?:...)*$)/);
	                        		value = value.join(',');
	                        		return value+"개";
	                        		}
	                            }
	                        }
	                    ]
	                },plugins: {
	              		datalabels: {
	            	        borderRadius: 4,
	            	        color: '#4e342e',
	            	        font: {
	        	          		weight: 'bold'
	            	        },
	            	        formatter: function(value, context) { return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "개"; },
	            	        padding: 1,
	            	        align: 'start'
	        	      }
	        	    },
	        		tooltips: { 
	                   callbacks: { 
	                       label: function(tooltipItem, data) { //그래프 콤마
	                           return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "개";
	                           } 
	        	    	}
	        		}
	            } // 옵션
	        }); // myChart
		}// replyChart() 

	// 처음시작만 defaultdate로 하고 나머지는 startdate, enddate로 값이 들어와야한다.
	let nowDate = new Date();
	let year = nowDate.getFullYear();
	let month = nowDate.getMonth()+1;
	let day = nowDate.getDate();	

	let fristgodate = year+"-"+month+"-"+day;
	let endgodate = year+"-"+month+"-"+day;
		
		
	// 1. ajax로 그래프 바로 호출
	function startMainChart(i,searchWord,back,startdate,enddate){

		let nowPage = i;

		$.ajax({
			url:"/myapp/allSalesBuyCount",
			data:"sdate="+startdate+"&"+
				 "edate="+enddate+"&"+
				 "nowPage="+nowPage+"&"+
				 "searchWord="+searchWord,
			success:function(result){
				
				if(back!=1){
					let startTopFran = '${topsVo.topTotalFran }';
					let startTopBuyCnt = '${topsVo.topTotalBuyCnt }';
					let startTopBuyUser = '${topsVo.topTotalBuyUser }';
					let startTopSales = '${topsVo.topTotalSales }';
					
					startTopFran = priceToString(startTopFran);
					startTopBuyCnt = priceToString(startTopBuyCnt);
					startTopBuyUser = priceToString(startTopBuyUser);
					startTopSales = priceToString(startTopSales);
	
					$('#topTotalFran').html(startTopFran);
					$('#topTotalBuyCnt').html(startTopBuyCnt);
					$('#topTotalBuyUser').html(startTopBuyUser);
					$('#topTotalSales').html(startTopSales);
				}
				
				let chartlist = $(result.chartlist);
				
				// 선택한 기간에 조회되는 데이터가 없는 경우
				if(chartlist.length==0){
					$('#myChartBox').empty();
					$('#myChartBox').html('<h2 class="noDataMainChart">해당 기간의 데이터가 없어 조회할 수 없습니다.</h2>');	    					
					$('.sidePieChartDiv').append('<h4 class="noDataSideChart">해당 기간의 데이터가 없어 조회할 수 없습니다.</h4>');							
					$('.salesDiv').append('<h3 class="noDataList">해당 기간의 데이터가 없어 목록을 조회할 수 없습니다.</h3>');	    					
					
					return;
				}else{
					$('.noDataMainChart').remove();
					$('.noDataSideChart').remove();
					$('.noDataList').remove();
				}	    				
				
				
				chartLabels =[]; // x축 라벨 초기화
				chartData = [];	 // 데이터 초기화   				
				
				 // 그래프에 데이터 셋팅
				chartlist.each(function(idx,vo){
					chartLabels.push(vo.p_name);
					chartData.push(vo.totalcnt);
					if(chartLabels.length==10 && chartData.length==10){ // 1~10위까지 출력하기 위해서 escape 설정
						return false;
					}
				});
				
				if(back!=1){
					
				
					$('#myChart').remove();
					$('#myChartBox').append('<canvas id="myChart" width="1000" height="300" style="display:inline-block; margin:10px 0px 0px 55px;" ></canvas>');
				
					replyChart(chartLabels,chartData); // 메인막대차트 재호출
					
					// 사이드그래프 데이터 셋팅
					let sideChartSum = chartData.reduce((acc,cur,i) => acc+cur, 0);
					
					let numberOneRankName = chartLabels[0];
					let numberOneRankData = chartData[0];
					
					sideChartRate = Math.round((numberOneRankData/sideChartSum)*100); // 1위비율
					$('.sidePieChartCenter').html(sideChartRate+"%");
					$('.sideChartWriteName').html(numberOneRankName);
					sideChartreplay(sideChartRate); // 사이드차트 재호출
				
				}
				// 리스트 셋팅
				let salesListPage = $(result.salesListPage);
				
				if(salesListPage.length==0){
					let notSearch = '<div style="text-align:center;">'+searchWord+'에 대해 0건이 발견되었습니다.</div>';
					$('.salesRankList').html(notSearch);
					$('.page_nation').empty();
				}else{
					let chartList = '';
					
					salesListPage.each(function(idx,vo){
						chartList += '<li>'+vo.rank+'</li>'+						
						'<li>'+vo.p_name+'</li>'+						
						'<li>'+vo.totalsales.toLocaleString()+'</li>'+
						'<li>'+vo.totalcnt.toLocaleString()+'</li>';
					});// each()
					$('.salesRankList').html(chartList);
					
					//페이징
					$('.page_nation').empty();
					
					let sw = "'"+result.pagesVo.searchWord+"'";
					startdate = "'"+startdate+"'";
					enddate = "'"+enddate+"'";
					
					let nowPageMinerOne = nowPage-1;  // 현재페이지-1
					nowPageMinerOne = "'"+nowPageMinerOne+"'";
									
					let nextBtn = parseInt(nowPage);
					let plusOne = parseInt("1");
					let nowPagePlusOne = parseInt(nextBtn + plusOne);
					
					if(nowPage>1){
						$('.page_nation').append('<a class="arrow pprev" href="javascript:startMainChart(1,'+sw+',1,'+startdate+','+enddate+')"></a>');
						$('.page_nation').append('<a class="arrow prev" href="javascript:startMainChart('+nowPageMinerOne+','+sw+',1,'+startdate+','+enddate+')"></a>');
	
						
					}else if(nowPage==1){
						$('.page_nation').append('<a class="arrow pprev" href="javascript:startMainChart(1,'+sw+',1,'+startdate+','+enddate+')"></a>');
						$('.page_nation').append('<a class="arrow prev" href="javascript:startMainChart(1,'+sw+',1,'+startdate+','+enddate+')"></a>');
	
											
					}				
					for (var j = result.pagesVo.startPage; j <=result.pagesVo.startPage+result.pagesVo.onePageViewNum-1; j++) {						
						
						let sw2 = "'"+result.pagesVo.searchWord+"'";
						
						if(j<=result.pagesVo.totalPage){
							if(j==nowPage){
								$('.page_nation').append('<a class="active" href="javascript:startMainChart('+j+','+sw2+',1,'+startdate+','+enddate+')">'+j+'</a>');
	
							}else if(j!=nowPage){
								$('.page_nation').append('<a href="javascript:startMainChart('+j+','+sw2+',1,'+startdate+','+enddate+')">'+j+'</a>');
	
							}
						}
					}
					if(nowPage==result.pagesVo.totalPage){
						$('.page_nation').append('<a class="arrow next" href="javascript:startMainChart('+result.pagesVo.totalPage+','+sw+',1,'+startdate+','+enddate+')"></a>');
	
					}else{
						$('.page_nation').append('<a class="arrow next" href="javascript:startMainChart('+nowPagePlusOne+','+sw+',1,'+startdate+','+enddate+')"></a>');
	
					}
					$('.page_nation').append('<a class="arrow nnext" href="javascript:startMainChart('+result.pagesVo.totalPage+','+sw+',1,'+startdate+','+enddate+')"></a>');
					
				}// else				
			},error:function(error){
				alert("처음시작 그래프값 가져오기 error");
			}	 
		}); //ajax
	}// 시작시 그래프 ajax호출하는 함수


	$(()=>{		
		
		// 달력
		$( "#sdate,#edate" ).datepicker({
            changeMonth: true,
            changeYear: true,
            showMonthAfterYear: true,
            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
            dateFormat:'yy-mm-dd',
            maxDate: new Date
        });// 데이트피커
       
       	$('#sdate').datepicker("option", "maxDate", $("#edate").val());
       	$('#sdate').datepicker("option", "onClose", function (selectedDate){
        	$("#edate").datepicker( "option", "minDate", selectedDate );
       	});// 데이트피커 설정
       
       	$('#edate').datepicker();
      	$('#edate').datepicker("option", "minDate", $("#sdate").val());
       	$('#edate').datepicker("option", "onClose", function (selectedDate){
           	$("#sdate").datepicker( "option", "maxDate", selectedDate );
       	}); // 데이트피커설정
	   
		// 날짜 클릭할 때마다 그래프와 리스트 재호출 메소드

	   	// 날짜선택 변경이벤트
		$('input[name=dateSelect]').change(function(){
			$('.datebox').children('label').removeClass('dateboxlabel');
			$('.datebox').children('label').addClass('dateUnChecked');			
			$(this).next().removeClass('dateUnChecked');
			$(this).next().addClass('dateChecked');
		});
	    
    	// 처음시작할때 오늘라벨에 색상줌.
	    function defaultDate(defaultdate){    		
			$('#sdate').val(defaultdate);
			$('#edate').val(defaultdate);
			
			$('#today').next().removeClass('dateboxlabel');
			$('#today').next().addClass('dateChecked');
	    }	   
	    

	    // 날짜선택 조회를 누를 때 해당그래프와 하단 목록을 같이 출력해야 한다. (검색기능과 거의동일)
	    $('#dateViewBtn').on('click',function(){
	    	let selectsdate = $('#sdate').val();
	    	let selectedate = $('#edate').val();
	    	let nowPage = 1;
	    	let dateSearchWord = "";
	    	
	    	
	    	if(selectsdate=="" || selectsdate==null || selectedate=="" || selectedate==null){
	    		alert("조회할 날짜를 선택하세요");
	    		return false;
	    	}else{
		    	$.ajax({
		    		url:"/myapp/allSalesBuyCount",
	    			data:"sdate="+selectsdate+"&"+
	    				 "edate="+selectedate+"&"+
	    				 "nowPage="+nowPage+"&"+
	    				 "searchWord="+dateSearchWord,
	    			success:function(result){
	    				$('#topTotalFran').html(result.dateTopsVo.topTotalFran.toLocaleString());
	    				$('#topTotalBuyCnt').html(result.dateTopsVo.topTotalBuyCnt.toLocaleString());
	    				$('#topTotalBuyUser').html(result.dateTopsVo.topTotalBuyUser.toLocaleString());
	    				$('#topTotalSales').html(result.dateTopsVo.topTotalSales.toLocaleString());
	    				
	    				let chartlist = $(result.chartlist);
	    				
	    				// 선택한 기간에 조회되는 데이터가 없는 경우
	    				if(chartlist.length==0){
	    					$('#myChartBox').empty();
	    					$('#myChartBox').html('<h2 class="noDataMainChart">해당 기간의 데이터가 없어 조회할 수 없습니다.</h2>');	    					
							$('.sidePieChartDiv').append('<h4 class="noDataSideChart">해당 기간의 데이터가 없어 조회할 수 없습니다.</h4>');							
							$('.salesDiv').append('<h3 class="noDataList">해당 기간의 데이터가 없어 목록을 조회할 수 없습니다.</h3>');	    					
	    					
							return;
	    				}else{
	    					$('.noDataMainChart').remove();
	    					$('.noDataSideChart').remove();
	    					$('.noDataList').remove();
	    				}	    				
	    				
	    				
	    				chartLabels =[]; // x축 라벨 초기화
	    				chartData = [];	 // 데이터 초기화   				
	    				
	    				 // 그래프에 데이터 셋팅
	    				chartlist.each(function(idx,vo){
	    					chartLabels.push(vo.p_name);
	    					chartData.push(vo.totalcnt);
	    					if(chartLabels.length==10 && chartData.length==10){ // 1~10위까지 출력하기 위해서 escape 설정
	    						return false;
	    					}
	    				});	    				
	    				
    					$('#myChart').remove();
    					$('#myChartBox').append('<canvas id="myChart" width="1000" height="300" style="display:inline-block; margin:10px 0px 0px 55px;" ></canvas>');
    				
    					replyChart(chartLabels,chartData); // 메인막대차트 재호출
    					
    					// 사이드그래프 데이터 셋팅
    					let sideChartSum = chartData.reduce((acc,cur,i) => acc+cur, 0);
    					
    					let numberOneRankName = chartLabels[0];
    					let numberOneRankData = chartData[0];
    					
    					sideChartRate = Math.round((numberOneRankData/sideChartSum)*100); // 1위비율
    					$('.sidePieChartCenter').html(sideChartRate+"%");
    					$('.sideChartWriteName').html(numberOneRankName);
    					sideChartreplay(sideChartRate); // 사이드차트 재호출
	    				
	    				
	    				// 리스트 셋팅
	    				let salesListPage = $(result.salesListPage);
	    				
	    				if(salesListPage.length==0){
	    					let notSearch = '<div style="text-align:center;">'+searchWord+'에 대해 0건이 발견되었습니다.</div>';
	    					$('.salesRankList').html(notSearch);
	    					$('.page_nation').empty();
	    				}else{
	    					let chartList = '';
	    					
	    					salesListPage.each(function(idx,vo){
	    						chartList += '<li>'+vo.rank+'</li>'+	    						
	    						'<li>'+vo.p_name+'</li>'+	    						
	    						'<li>'+vo.totalsales.toLocaleString()+'</li>'+
	    						'<li>'+vo.totalcnt.toLocaleString()+'</li>';
	    					});// each()
	    					$('.salesRankList').html(chartList);
	    					
	    					//페이징
	    					$('.page_nation').empty();
	    					
	    					let sw = "'"+result.pagesVo.searchWord+"'";
	    					selectsdate = "'"+selectsdate+"'";
	    					selectedate = "'"+selectedate+"'";
	    					
	    					let nowPageMinerOne = nowPage-1;  // 현재페이지-1
	    					nowPageMinerOne = "'"+nowPageMinerOne+"'";
	    									
	    					let nextBtn = parseInt(nowPage);
	    					let plusOne = parseInt("1");
	    					let nowPagePlusOne = parseInt(nextBtn + plusOne);
	    					
	    					if(nowPage>1){
	    						$('.page_nation').append('<a class="arrow pprev" href="javascript:startMainChart(1,'+sw+',1,'+selectsdate+','+selectedate+')"></a>');
	    						$('.page_nation').append('<a class="arrow prev" href="javascript:startMainChart('+nowPageMinerOne+','+sw+',1,'+selectsdate+','+selectedate+')"></a>');
	    	
	    						
	    					}else if(nowPage==1){
	    						$('.page_nation').append('<a class="arrow pprev" href="javascript:startMainChart(1,'+sw+',1,'+selectsdate+','+selectedate+')"></a>');
	    						$('.page_nation').append('<a class="arrow prev" href="javascript:startMainChart(1,'+sw+',1,'+selectsdate+','+selectedate+')"></a>');
	    	
	    											
	    					}				
	    					for (var j = result.pagesVo.startPage; j <=result.pagesVo.startPage+result.pagesVo.onePageViewNum-1; j++) {						
	    						
	    						let sw2 = "'"+result.pagesVo.searchWord+"'";
	    						
	    						if(j<=result.pagesVo.totalPage){
	    							if(j==nowPage){
	    								$('.page_nation').append('<a class="active" href="javascript:startMainChart('+j+','+sw2+',1,'+selectsdate+','+selectedate+')">'+j+'</a>');
	    	
	    							}else if(j!=nowPage){
	    								$('.page_nation').append('<a href="javascript:startMainChart('+j+','+sw2+',1,'+selectsdate+','+selectedate+')">'+j+'</a>');
	    	
	    							}
	    						}
	    					}
	    					if(nowPage==result.pagesVo.totalPage){
	    						$('.page_nation').append('<a class="arrow next" href="javascript:startMainChart('+result.pagesVo.totalPage+','+sw+',1,'+selectsdate+','+selectedate+')"></a>');
	    	
	    					}else{
	    						$('.page_nation').append('<a class="arrow next" href="javascript:startMainChart('+nowPagePlusOne+','+sw+',1,'+selectsdate+','+selectedate+')"></a>');
	    	
	    					}
	    					$('.page_nation').append('<a class="arrow nnext" href="javascript:startMainChart('+result.pagesVo.totalPage+','+sw+',1,'+selectsdate+','+selectedate+')"></a>');
	    				
	    				}
	    				
	    			},error:function(error){
	    				
	    			}	 
		    	});//ajax
	    		
	    	}// else
	    });// 날짜조회버튼
	    
	    
	    
	    ///////////////////////////////////////////
	    // 단어 검색
	    $('input[value=Search]').on('click',function(){
	    	let startdate = $('#sdate').val();
	    	let enddate = $('#edate').val();
	    	let inputSearchWord = $('input[name=searchWord]').val();
	    	let nowPage = 1;
	    	
	    	if(inputSearchWord=="" || inputSearchWord==null){
	    		alert("검색어를 입력해주세요");
	    		return false;
	    	}else if(startdate == "" || startdate ==null || enddate=="" || enddate==null){
	    		alert("날짜를 선택해주세요");
	    		return false;
	    	}else{
	    		$.ajax({
	    			url:"/myapp/allSalesBuyCount",
	    			data:"sdate="+startdate+"&"+
	    				 "edate="+enddate+"&"+
	    				 "nowPage="+nowPage+"&"+
	    				 "searchWord="+inputSearchWord,
	    			success:function(result){
	    				// 상단 총합 알림 셋팅
	    				$('#topTotalFran').html(result.dateTopsVo.topTotalFran.toLocaleString());
	    				$('#topTotalBuyCnt').html(result.dateTopsVo.topTotalBuyCnt.toLocaleString());
	    				$('#topTotalBuyUser').html(result.dateTopsVo.topTotalBuyUser.toLocaleString());
	    				$('#topTotalSales').html(result.dateTopsVo.topTotalSales.toLocaleString());

	    				let chartlist = $(result.chartlist);
	    				
	    				chartLabels =[]; // x축 라벨 초기화
	    				chartData = [];	 // 데이터 초기화   				
	    				
	    				// 그래프에 데이터 셋팅
	    				chartlist.each(function(idx,vo){
	    					chartLabels.push(vo.p_name);
	    					chartData.push(vo.totalcnt);
	    					if(chartLabels.length==10 && chartData.length==10){ // 1~10위까지 출력하기 위해서 escape 설정
	    						return false;
	    					}
	    				});	    				
						
	    				$('#myChart').remove();
	    				$('#myChartBox').append('<canvas id="myChart" width="1000" height="300" style="display:inline-block; margin:10px 0px 0px 55px;" ></canvas>');
	    				
	    				replyChart(chartLabels,chartData); // 메인막대차트 재호출
	    				
	    				// 사이드그래프 데이터 셋팅
	    				let sideChartSum = chartData.reduce((acc,cur,i) => acc+cur, 0);
	    				
	    				let numberOneRankName = chartLabels[0];
	    				let numberOneRankData = chartData[0];
	    				
	    				sideChartRate = Math.round((numberOneRankData/sideChartSum)*100); // 1위비율
	    				$('.sidePieChartCenter').html(sideChartRate+"%");
	    				$('.sideChartWriteName').html(numberOneRankName);
	    				sideChartreplay(sideChartRate); // 사이드차트 재호출
	    				
	    				// 리스트출력	    				
	    				let salesListPage = $(result.salesListPage);
	    				
	    				if(salesListPage.length==0){
	    					let notSearch = '<div style="text-align:center;">'+inputSearchWord+'에 대해 0건이 발견되었습니다.</div>';
	    					$('.salesRankList').html(notSearch);
	    					$('.page_nation').empty();
	    				}else{
	    					let chartList = '';
	    					
	    					salesListPage.each(function(idx,vo){
	    						chartList += '<li>'+vo.rank+'</li>'+	    						
	    						'<li>'+vo.p_name+'</li>'+	    						
	    						'<li>'+vo.totalsales.toLocaleString()+'</li>'+
	    						'<li>'+vo.totalcnt.toLocaleString()+'</li>';
	    					});// each()
	    					$('.salesRankList').html(chartList);
	    					
	    					//페이징
	    					$('.page_nation').empty();
	    					
	    					let sw = "'"+result.pagesVo.searchWord+"'";
	    					startdate = "'"+startdate+"'";
	    					enddate = "'"+enddate+"'";
	    					
	    					let nowPageMinerOne = nowPage-1;  // 현재페이지-1
	    					nowPageMinerOne = "'"+nowPageMinerOne+"'";
	    									
	    					let nextBtn = parseInt(nowPage);
	    					let plusOne = parseInt("1");
	    					let nowPagePlusOne = parseInt(nextBtn + plusOne);
	    					
	    					if(nowPage>1){
	    						$('.page_nation').append('<a class="arrow pprev" href="javascript:startMainChart(1,'+sw+',1,'+startdate+','+enddate+')"></a>');
	    						$('.page_nation').append('<a class="arrow prev" href="javascript:startMainChart('+nowPageMinerOne+','+sw+',1,'+startdate+','+enddate+')"></a>');
	    						
	    					}else if(nowPage==1){
	    						$('.page_nation').append('<a class="arrow pprev" href="javascript:startMainChart(1,'+sw+',1,'+startdate+','+enddate+')"></a>');
	    						$('.page_nation').append('<a class="arrow prev" href="javascript:startMainChart(1,'+sw+',1,'+startdate+','+enddate+')"></a>');
	    	
	    											
	    					}				
	    					for (var j = result.pagesVo.startPage; j <=result.pagesVo.startPage+result.pagesVo.onePageViewNum-1; j++) {						
	    						
	    						let sw2 = "'"+result.pagesVo.searchWord+"'";
	    						
	    						if(j<=result.pagesVo.totalPage){
	    							if(j==nowPage){
	    								$('.page_nation').append('<a class="active" href="javascript:startMainChart('+j+','+sw2+',1,'+startdate+','+enddate+')">'+j+'</a>');
	    	
	    							}else if(j!=nowPage){
	    								$('.page_nation').append('<a href="javascript:startMainChart('+j+','+sw2+',1,'+startdate+','+enddate+')">'+j+'</a>');
	    	
	    							}
	    						}
	    					}
	    					if(nowPage==result.pagesVo.totalPage){
	    						$('.page_nation').append('<a class="arrow next" href="javascript:startMainChart('+result.pagesVo.totalPage+','+sw+',1,'+startdate+','+enddate+')"></a>');
	    	
	    					}else{
	    						$('.page_nation').append('<a class="arrow next" href="javascript:startMainChart('+nowPagePlusOne+','+sw+',1,'+startdate+','+enddate+')"></a>');
	    	
	    					}
	    					$('.page_nation').append('<a class="arrow nnext" href="javascript:startMainChart('+result.pagesVo.totalPage+','+sw+',1,'+startdate+','+enddate+')"></a>');
	    				}
	    			},error:function(request,status,error){	    				
	    				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    			}// error	 
	    		});// ajax
	    	}// else
	    	return false;	// form으로 인한 새로고침 방지
	    });// search sumbit click

	    
	    // 시작시 호출부분  ///////////////////////////////////////////////////////

	    startMainChart(1,"",0,fristgodate,endgodate);
	    defaultDate(defaultdate);
		
	});// jqery

	
	// 날짜버튼
  	function dateSel(choice){
	
		let nowDate = new Date();
		
		let year = nowDate.getFullYear();
		let month = nowDate.getMonth();
		let day = nowDate.getDate();
		
		let today = new Date(year,month,day).toLocaleDateString();
		
		if(choice==1){			
			document.getElementById('sdate').value = convertDateFormat(today);			
		}else if(choice==-1){// 하루전
			let oneday = new Date(year,month,day-1).toLocaleDateString();			
			document.getElementById('sdate').value = convertDateFormat(oneday);			
		}else if(choice==7){//일주일전
			let oneweek = new Date(year,month,day-7).toLocaleDateString();
			document.getElementById('sdate').value = convertDateFormat(oneweek);
		}else if(choice==30){// 한달전
			let onemonth = new Date(year, month-1, day).toLocaleDateString();
			document.getElementById('sdate').value = convertDateFormat(onemonth);
		}else if(choice==90){// 세달전
			let threemonth = new Date(year, month-3,day).toLocaleDateString();
			document.getElementById('sdate').value = convertDateFormat(threemonth);
		}else if(choice==180){// 육개월전
			let sixmonth = new Date(year,month-6,day).toLocaleDateString();
			document.getElementById('sdate').value = convertDateFormat(sixmonth);
		}
		document.getElementById('edate').value= convertDateFormat(today);
    }		
			
	function convertDateFormat(date) {// .변환 정규표현식			
 		return date.replace(/\./g, '').split(' ').map((v,i)=> i > 0 && v.length < 2 ? '0' + v : v).join('-');
	}
</script>
</head>
<body>
	<header>
		<div class="area"></div><nav class="main-menu">
            <ul>
                <li>
                    <a href="/myapp/adminSalesMainPage">
                        <i class="fa fa-2x"></i>
                        <span class="nav-text">전체매출목록</span>
                    </a>                  
                </li>
                <li class="has-subnav">
                    <a href="#">
                       <i class="fa fa-2x"></i>
                        <span class="nav-text">총 판매량순위</span>
                    </a>                    
                </li>
                <li class="has-subnav">
                    <a href="/myapp/adminSalesFranPageGo">
                       <i class="fa fa-2x"></i>
                        <span class="nav-text">가맹점별 매출순위</span>
                    </a>                   
                </li>                
                <li>
                   <a href="/myapp/adminHome">
                        <i class="fa fa-2x"></i>
                        <span class="nav-text">관리자메인</span>
                    </a>
                </li>
           </ul>
            <ul class="logout">
                <li>
                   <a href="/myapp/logout">
                         <i class="fa fa-2x"></i>
                        <span class="nav-text">Logout</span>
                    </a>
                </li>  
            </ul>
        </nav>		
	</header>
	<main>
		<div class="topmain">			
	    	<div class="topbox">
	    		<div class="nav-box f1box" id="totalFran">
	    			<h4>총 가맹점수</h4>
	    			<h2 id="topTotalFran"></h2>	    			
	    		</div>
	    		<div class="nav-box f1box" id="totalBuyCnt">
	    			<h4>총 구매횟수</h4>
	    			<h2 id="topTotalBuyCnt"></h2>
	    		</div>
	    		<div class="nav-box f1box" id="totalBuyUser">
	    			<h4>총 이용고객 수</h4>
	    			<h2 id="topTotalBuyUser"></h2>
	    		</div>
	    		<div class="nav-box f1box" id="totalSales">
	    			<h4>총 판매액</h4>
	    			<h2 id="topTotalSales"></h2>
	    		</div>    		
	    	</div>
   		 	<div class="searchDiv">
 				<input type="text" name="searchWord" placeholder="상품명을 입력해주세요"/>
 				<input type="submit" value="Search"/>
 			</div> 		
	 		<div class="salesDiv">
	 			<ul class="salesList">
 					<!-- if -->
 					<li>순위</li>
 					<li>상품명</li>	 					
 					<li>총판매액<span style="font-size:14px;">(원)</span></li>
 					<li>총판매수량</li>
 				</ul>
 				<ul class="salesRankList">
 				</ul>
	 			<div class="page_nation">	 				
				</div>
	 			</div>
	    	
	    	
	    	<!-- 사이드 파이차트 -->        
	        <div class="sidePieChartDiv">
	        	<div class="pie-chart sidePieChart">
	        		<span class="sidePieChartCenter"></span>
	        		<span class="sideChartWriteName"></span><span class="sideChartWriteGa">&nbsp;가</span>
	        		<span class="sideChartWriteDocu">상위 10개 품목에서 차지하는 비율</span>
	        	</div>
	        </div>   
        </div>
        
	<form id="frm">     
	        <!-- 기존날짜 -->
	        <div class="choiceDateMain">
		 		<div class="choiceDateDiv">	 			 		
		        	<h4>기간별 날짜 선택하기</h4>
		 			<ul class="dateul">
		 				<li>
			 				<span class="datebox">
			 					<input type="radio" name="dateSelect" id="today" onclick="dateSel(1)" checked/>
			 					<label for="today" class="dateboxlabel">오늘</label>
			 				</span>
			 			</li>
		 				<li>
			 				<span class="datebox">
			 					<input type="radio" name="dateSelect" id="yesterday" onclick="dateSel(-1)"/>
			 					<label for="yesterday" class="dateboxlabel">어제</label>
			 				</span>
			 			</li>
			 			<li>
			 				<span class="datebox">
			 					<input type="radio" name="dateSelect" id="week" onclick="dateSel(7)"/>
			 					<label for="week" class="dateboxlabel">1주</label>
			 				</span>
			 			</li>
			 			<li>
			 				<span class="datebox">
			 					<input type="radio" name="dateSelect" id="onemonth" onclick="dateSel(30)"/>
			 					<label for="onemonth" class="dateboxlabel">1개월</label>
			 				</span>
			 			</li>
			 			<li>
			 				<span class="datebox">
			 					<input type="radio" name="dateSelect" id="threemonth" onclick="dateSel(90)"/>
			 					<label for="threemonth" class="dateboxlabel">3개월</label>
			 				</span>
			 			</li>
			 			<li>
			 				<span class="datebox">
			 					<input type="radio" name="dateSelect" id="sixmonth" onclick="dateSel(180)"/>
			 					<label for="sixmonth" class="dateboxlabel">6개월</label>
			 				</span>
			 			</li>		
		 			</ul>
		 			<div class="dateformdiv">
		 				<input name="sdate" id="sdate" class="dateform" readonly placeholder="시작일 선택">&nbsp;~&nbsp;<input name="edate" id="edate" class="dateform" readonly placeholder="종료일 선택">
		 				<input type="button" value="조회하기" id="dateViewBtn"/>
		 			</div>
		 		</div>
		 	</div>	 	
		
	 		<div class="maindiv">
	 			<div class="box chartbox" id="myChartBox">
	 				<canvas id="myChart" width="1000" height="300" style="display:inline-block; margin:10px 0px 0px 55px;" ></canvas>
	 			</div>
	 		</div>
	</form>        
</main>
</body>
</html>