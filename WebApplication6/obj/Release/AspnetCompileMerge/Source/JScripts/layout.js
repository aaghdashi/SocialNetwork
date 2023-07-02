

//slide show 
$(function(){
$('document').ready(function(){
ItemsPath = "./images/"; 
var images = ['3.jpg', '2.jpg', '1.jpg', '4.jpg', '5.jpg', '6.jpg', '7.jpg'];
		//load image
		function loadImage(img) {
		    $('#image img#show').fadeOut('slow', function () {
			    $('#image img#show').attr('src', img.attr('src')).fadeIn('slow');
			});
//change css class
			$('#bar img').removeClass('currentImg');
			$(img).addClass('currentImg');
		}
//change pic		
		function goNext() {
			var nextItem = $('.currentImg').next();
			if(nextItem.length == 0) {
				nextItem = $('#bar>img:first');
			}
			
			loadImage(nextItem);
		}

		$(function() {
			for(i=0; i<images.length; i++) {
				var img = $('<img />');
				img.attr('src', ItemsPath + images[i]);
			
				$('#bar').append(img);
			}	
			
			loadImage($('#bar>img:first'));

			$('#bar img').click(function() {
			    loadImage($(this));

			    clearInterval(myInterval);
			    myInterval = setInterval(goNext,10000);
			});
			
			var myInterval = setInterval(goNext, 10000);
		});
});
});