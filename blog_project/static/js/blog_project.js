function getDocHeight() {
    var D = document;
    return Math.max(
        D.body.scrollHeight, D.documentElement.scrollHeight,
        D.body.offsetHeight, D.documentElement.offsetHeight,
        D.body.clientHeight, D.documentElement.clientHeight
    );
}

$(window).scroll(function() {
   	if($(window).scrollTop() + $(window).height() == getDocHeight()) {
       $('#footer-container').addClass('full-width');
    }
    if($(window).scrollTop() + $(window).height() != getDocHeight()) {
       $('#footer-container').removeClass('full-width');
    }
 });