<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jspf" %>
<style>
	body{
		margin:0px;
		padding:0px;
	}
	#container{
		width:100%;
		height:700px;
		background-color:rgb(245, 240, 233);
		display: flex;
   		justify-content: space-evenly;
   		align-items: center;
	}

	#img{
		width:500px;
		height:500px;
		border-radius:100%;
	}
	#container>div{
		display: flex;
		justify-content: center;	
	}
	
	.content_1{
		color:rgb(0, 163, 239);
	}
	.content_2{
		font-size:2.5em;
	}
	.content_4{
		font-size:1.1em;
	}
	.content_5{
		font-size:0.9em;
	}
	.content_6{
		font-size:0.9em;
	}
	span{
		text-align:center;
		margin-left:40px;
		color:rgb(0, 163, 239);
		font-size:1.1em;
	}
	#left_content{
		width:400px;
		flex-direction: column;
	}
	#right_content{
		width:400px;
		flex-direction: column;
	}
	.fa-mug-hot,.fa-flask{
    	font-size: 50px;
    	color:gray;
    	display:flex;
	}
	
</style>
</head>
<meta charset="UTF-8">

<body>
<div id="container">
	<div id="left_content">
		<div class= "content_1">${MenuVO.p_ename}</div><br/>
		<div class= "content_2">${MenuVO.p_name }</div><br/>
		<div class= "content_3">${MenuVO.p_desc }
		<br/><br/><br/><br/><br/>
		구분 : Ice <br/><br/>
		제공사이즈 : Standard
	</div>
	</div>
	<div><img src="img/${MenuVO.p_img}" id="img"/></div>
	<div id="right_content">
	<i class="fas fa-flask"></i>
	<!-- <i class="fas fa-mug-hot"></i> -->
		<div class= "content_4"> 영양 정보 </div><br/>
		<div class= "content_5">1회제공량기준 standard</div><br/>
		<div class= "content_6">제공량(ml) <span> ${MenuVO.p_info1 } </span>
			<hr/><br/>열량(kcal)  <span> &nbsp;&nbsp;${MenuVO.p_info2 } </span> 당류(g) <span>  ${MenuVO.p_info3 } </span><br/><br/>
					  나트륨(mg)  <span>  ${MenuVO.p_info4 }  </span> 단백질(g) 	<span>  ${MenuVO.p_info5 }  </span><br/><br/>
					  포화지방(g)  <span>  ${MenuVO.p_info6 }  </span> 카페인(mg) <span>  ${MenuVO.p_info7 }  </span>
		</div>
	</div>
</div>
<%@ include file="/inc/bottom3.jspf" %>