$(document).ready(function(){
  setInterval(function() {
    var divID = Math.floor((Math.random() * 14 ) + 1);
    var $divToChange = $('#homeImg' + divID);
    $divToChange.fadeOut(300, function() {
      imageUrls.push($divToChange.css("background-image"));
      $divToChange.css("background-image", imageUrls.shift());
      $divToChange.fadeIn(300);
    });

  }, 3000);
});
