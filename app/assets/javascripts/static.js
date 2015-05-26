$(document).ready(function(){
  setInterval(function() {
    var divID = Math.floor((Math.random() * 14 ) + 1);
    imageUrls.push($('#homeImg' + divID).css("background-image"));
    $('#homeImg' + divID).css("background-image", imageUrls.shift())
  }, 1000);
});
