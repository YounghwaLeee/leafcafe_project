$('.nav>li:not(.home)').on('mouseenter',function(){
		$('#menu-bg').stop().slideDown();	
		$('.sublist').stop().slideDown();
	});
	$('#menu-bg').on('mouseleave',function(){
		$(this).stop().slideUp();	
		$('.sublist').stop().slideUp();
	});