$( document ).ready(function () {
  $(".dropdown-trigger").dropdown({ hover: true });
  $(".tabs").tabs({});
  $('.modal').modal({});
  $('.tooltipped').tooltip({});

  $(".close-button").click(function () {
    // remove content
    $($(this).parent().attr("href")).remove();
    // remove tab
    $(this).parent().parent().remove();
  });
})