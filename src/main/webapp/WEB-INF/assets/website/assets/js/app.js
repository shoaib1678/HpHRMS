/* Theme Name: 115
  Author: Themesdesign
  Version: 1.0.0
  File Description: Main JS file of the template
*/

	  /* --------------------------------------------------------
    scrollUp active
  -------------------------------------------------------- */
    var scrollUpBtn = $('#scrollup');

    $(window).scroll(function () {
      if ($(window).scrollTop() > 700) {
        scrollUpBtn.addClass('show');
      } else {
        scrollUpBtn.removeClass('show');
      }
    });

    scrollUpBtn.on('click', function (e) {
      e.preventDefault();
      $('html, body').animate({ scrollTop: 0 }, 300);
    });


$(document).ready(function () {
	 $(".large-logo").hide();
	
    $('.fix_header').mouseenter(function () {
        $(".nav_item").slideDown('slow');
        /*$(".small-logo").hide('fast');
        $(".large-logo").show('fast');*/
         /*$(".large-logo").slideDown('slow');*/
    });

    $('.fix_header').mouseleave(function () {
        $(".nav_item").slideDown('fast');
        $(".nav_item").hide('fast');
        /*  $(".small-logo").show('fast');
           $(".large-logo").hide('fast');*/
    });
});

    // Header 
    const header = document.querySelector(".sticky-header");
    const smallheader = document.querySelector(".mobile_header");
    const toggleClass = "is-sticky";


    window.addEventListener("scroll", () => {
      const currentScroll = window.pageYOffset;
      if (currentScroll > 300) {
        header.classList.add(toggleClass);
        smallheader.classList.add(toggleClass);

        $(".is-sticky .nav-link").addClass("link_color");
      } else {
        header.classList.remove(toggleClass);
        smallheader.classList.remove(toggleClass);
      }
    });
  /*  $(function () {
      $(".page-header").addClass("nav_bg");
    })*/
    $(".navbar-toggler").click(function() {
		
        $(".fix_header").css("transform", "translateX(0px)");
        $(".fix_header").css("height", "100vh");
        $(".brand_logo").css("transform", "translate3d(1.75rem,1rem,0) rotateZ(90deg)");
         $(".nav_item").slideDown('slow');
         
         $("#cross_icon").toggle();
        $("#sonu").toggleClass("bg_fade");
		
    })
	$("#cross_icon").click(function(){
		$(".fix_header").css("transform", "translatex(-330px)");
		$("#sonu").toggleClass("bg_fade");
		 $(".nav_item").slideDown('fast');
		  $(".nav_item").hide('fast');
		  $(".brand_logo").css("transform", "translate3d(10.4rem,1rem,2em) rotateZ(0deg)");
		$(this).toggle();
	})

// two-step move next
function moveToNext(elem, count) {
    if (elem.value.length > 0) {
        document.getElementById("digit" + count + "-input").focus();
    }
}

