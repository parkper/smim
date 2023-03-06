$(document).ready(function(e) {
    $('#main-menu > li').mouseenter(function(e) {
        $(this).find('.sub-menu').stop().slideDown();
    });
    $('#main-menu > li').mouseleave(function(e) {
        $(this).find('.sub-menu').stop().slideUp();
    });
});