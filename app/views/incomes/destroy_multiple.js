if ($('.active').length > 0) {
var date = $('.active').attr('name')
$('#incomes').load('/income_table?date=' + date, function(){
});
$('#summary').load('/summary_boxes?date=' + date, function(){
});
}
else {
$('#incomes').load('/income_table', function(){
});
$('#summary').load('/summary_boxes', function(){
});
};