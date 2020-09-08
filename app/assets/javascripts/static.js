// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){
  $("div.floating-helper-container").addClass("hide");
  var pathURL = $(location).attr("pathname");
  if (pathURL == "/assemblies" ){
    $("div.floating-helper-container").removeClass("hide");
  }
  if (pathURL == "/processes" ){
    $("div.floating-helper-container").removeClass("hide");
  }
});
