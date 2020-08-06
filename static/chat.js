$( document ).ready(function () {
  $(".dropdown-trigger").dropdown({ hover: false });
  $(".tabs").tabs({});
  $('.modal').modal({});
  $('.tooltipped').tooltip({});
  $('.collapsible').collapsible({});

  $(".close-button").click(function () {
    // remove content
    $($(this).parent().attr("href")).remove();
    // remove tab
    $(this).parent().parent().remove();
  });
})