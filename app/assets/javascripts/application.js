// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.ui.all
//= require fullcalendar
//= require gcal

$(document).ready(function(){
  $(".order").click(function(e){
    e.preventDefault();
    $("#orderModal").modal('show');
    return false;
  });

  $( ".datepicker" ).datepicker({ dateFormat: "dd-mm-yy" });

  $('#calendar').fullCalendar({
      header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month'
    },
    selectable: true,
    selectHelper: true,
    lazyFetching: true,
  })
});