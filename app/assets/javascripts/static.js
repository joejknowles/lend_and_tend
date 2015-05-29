$(document).ready(function(){

  var randomPhotoSwitch = function(callback) {
    var divID = Math.floor((Math.random() * 12 ) + 1);
    var $divToChange = $('#homeImg' + divID);
    $divToChange.fadeOut(250, function() {
      imageUrls.push($divToChange.css("background-image"));
      $divToChange.css("background-image", imageUrls.shift());
      $divToChange.fadeIn(250);
    });
  };

  setInterval(function() {
    randomPhotoSwitch();
  }, 2500);
});
