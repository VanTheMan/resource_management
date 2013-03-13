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
    // $(this).parents("tr").find("td").last().css("display: block");
    e.preventDefault();
    $("#orderModal").modal('show');
    return false;
  });

  $( ".datepicker" ).datepicker({ dateFormat: "dd-mm-yy" });

  $(".order-form").submit(function(){
    var url = $(this).attr('action');
    var type = $(this).attr('method');
    var f = $(this);
    $.ajax({
      url: url,
      type: type,
      dataType: "json",
      data: f.serialize(),
      success: function(response){
        if (response.success){
          alert("Order Successfully!");
          $("#orderModal").modal('hide');
          f[0].reset();
          window.location.reload();
        } else {
          alert(response.html);
          $("#orderModal").modal('hide');
        }
      }
    });
    return false;
  });
});