if ($('.active').length > 0) {
var date = $('.active').attr('name')
$("#expenses").load('/expense_table?date=' + date, function(){
});
$("#summary").load('/summary_boxes?date=' + date, function(){
});
}
else {
$("#expenses").load('/expense_table', function(){
});	
$("#summary").load('/summary_boxes', function(){
});	
};

$('.success-message-expense').fadeIn(100).delay(1000).fadeOut(100);