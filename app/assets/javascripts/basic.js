$(window).ready(function(){
    $('body').css("height", $(window).height() + "px");
});

$(window).resize(function(){
    $('body').css("height", $(window).height() + "px");
});

$(window).trigger('resize');
