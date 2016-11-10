$(document).on("turbolinks:load", function() {
  $('.dropdown-toggle').dropdown();

  $(".dropdown").on("show.bs.dropdown hide.bs.dropdown", function() {
    $(this).find(".glyphicon").toggleClass("caret-up");
  });
});
