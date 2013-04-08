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
//= require jquery.ui.all
//= require rails.validations
//= require rails.validations.simple_form
//= require jquery.purr
//= require dataTables/jquery.dataTables
//= require best_in_place
//= require jquery.tablescroll
//= require_tree .

$(function() {
	$('#signin-text').click(function(){
	$('#my-div').toggle('bounce', { times:2 } ,300);
	});
});

$(function() {
	$('.menu-item').hover(function(){
	var item = $(this).attr("id");
	$("#" + item + "-menu").css('height', 'auto');
	},
	function() {
	$("#" + item + "-menu").css('height', '1px');
	});
});

jQuery(function($){
       $.datepicker.setDefaults({ dateFormat: 'yymmdd' });
       });

	$(function(){
		$('#login-form').show();
	});

$(function() {
  $(".side-list1").sortable();
  $(".side-list1").disableSelection();
  });

$(function() {
  $("a.item").click( function() {
                    $("a.item").removeClass("active activePrev");
                    $(this).addClass("active");
                    var date = $(this).attr('name');
                    $(this).parent().prevAll(":has(.item):first").children().addClass("activePrev");
                    $('#incomes').load('/income_table?date=' + date, function(){
                                       loadDiv();
                                       });
                    $('#expenses').load('/expense_table?date=' + date, function(){
                                        loadDiv();
                                        });
                    $('#summary').load('/summary_boxes?date=' + date, function(){
                                       loadDiv();
                                       });
                    $('#income-form-div').load('/income_form', function(){
                                               loadDiv();
                                               });
                    $('#expense-form-div').load('/expense_form', function(){
                                                loadDiv();
                                                });
                    var text = $(this).text();
                    $('.datebox').html(text);
                    });	
  });

$(function() { 
  $(".best_in_place").addClass("cursor");	
  });

$(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
  });

$(function() {
  $("a.item").removeClass("active activePrev");
  var date = $('.datebox').attr('id');
  var date = parseInt(date.substr(0, 6));
  $('[name^="' + date + '"]').addClass("active");
  var text = $('[name^="' + date + '"]').text();
  if (text.length <= 0) {
  text = "Full Year Overview";
  $('[name="all"]').addClass('active');
  }
  $('.datebox').html(text);
  $('.datebox').show();
  });


