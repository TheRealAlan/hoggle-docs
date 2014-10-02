var activeSlide, slides, numberOfSlides, slidesPosition, locks, lockpoints, sT;


try{Typekit.load({
  active: function() {
    initialize();
  }
});}catch(e){
  initialize();
}


function activateSlide(slide){
  $('.slide.active').removeClass('active');
  $(slide).addClass('active');
  
  // activate nav
  var target = $(slide).attr('id');
  $('#nav a.active').removeClass('active');
  $('#nav a[href="#' + target + '"]').addClass('active');
}




function windowSize(){
  var h = $(window).height();
  $('#slide10').css({'min-height' : h - 270});
  $('#slide0').height(h - 10).ready(function(){
    skrollr.init();
  });
  
  
  getSlidesPosition();

}

function getSlidesPosition(){
  // get position of each slide and put in an array
  slidesPosition = [];
  
  $(slides).each( function(i){
    slidesPosition[i] = $(this).offset().top;
  });
}




function goToClosestLockpoint(){
    

  
}

function initialize(){    
  
  if ($('html.ie9').is('*') || $('html.lt-ie9').is('*')){
    // swap out svg for png
    $('svg').each( function(){
      var replacement = $(this).attr('id');
      $(this).after('<img src="/assets/images/www/2012/' + replacement + '.png">').remove();
    });
  }
  
  
  windowSize();
  activeSlide = 0;
  
  // set array of slides
  slides = $('.slide');

  
  // get number of slides
  numberOfSlides = slides.length;
  // setNavigation(numberOfSlides);
  
  getSlidesPosition();
  
  $('.scroll').click(function(e){
    e.preventDefault();
    var target = $(this).attr('href');
    var scroll = $(target).offset().top;
    
    $('html,body').animate({
      scrollTop: scroll + 1
    }, 1000);
  });
  
  
  
  $('#nav a').click(function(e){
    e.preventDefault();
    var target = $(this).attr('href');
    var scroll = $(target).offset().top;
    
    $('html,body').animate({
      scrollTop: scroll + 1
    }, 1000);
  });
  $(window).load( function(){
    windowSize();
    skrollr.init().refresh();
  });
  
}

$(window).scroll(function(){
  sT = $(window).scrollTop();
  if( sT < slidesPosition[activeSlide] ){
    activeSlide--;
    activateSlide(slides[activeSlide]);
  }
  else if ( sT > slidesPosition[activeSlide+1]){
    activeSlide++;
    activateSlide(slides[activeSlide]);
  }
  

  
  
});

$(window).resize(function(){
  windowSize();
});