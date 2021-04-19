
document.getElementsByTagName('html')[0].style.fontSize = $(window).width()*100/640+'px';
$(window).resize(function(){
	document.getElementsByTagName('html')[0].style.fontSize = $(window).width()*100/640+'px';
});




$(function(){

function fontSize(){
var deviceWidth = $(document).width();
if(deviceWidth > 640){
    deviceWidth = 640;    
}
 
var fontSize = deviceWidth / 6.4;
$("html").css("fontSize",fontSize);
}
 
fontSize();
 
$(window).resize(function(){
    fontSize();
});
});







