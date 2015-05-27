$(document).ready(function(){

  var randomPhotoSwitch = function(callback) {
    var divID = Math.floor((Math.random() * 12 ) + 1);
    var $divToChange = $('#homeImg' + divID);
    $divToChange.fadeOut(300, function() {
      imageUrls.push($divToChange.css("background-image"));
      $divToChange.css("background-image", imageUrls.shift());
      $divToChange.fadeIn(300);
    });
  };

  setInterval(function() {
    randomPhotoSwitch();
  }, 3000);
});
