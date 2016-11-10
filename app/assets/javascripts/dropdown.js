$(document).on("turbolinks:load", function() {
  $('.dropdown-toggle').dropdown();

  $(".dropdown").on("show.bs.dropdown hide.bs.dropdown", function() {
    $(this).find(".glyphicon").toggleClass("custom-caret-up");
  });

  $('ul.dropdown-menu a[data-remote=true]').click(function () {
    $(this).closest('ul').prev('button').dropdown('toggle');
  });
});
