/**
 * Calender 설정
 */
$(document).ready(function() {
	var options = {};
	options.calender_style= "picker_2";
	options.singleDatePicker = true;
	options.timePicker = false;
	options.locale = {
	        format: 'YYYY-MM-DD',
	        separator: ' - ',
	        applyLabel: 'Apply',
	        cancelLabel: 'Cancel',
	        fromLabel: 'From',
	        toLabel: 'To',
	        customRangeLabel: 'Custom',
	        daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        firstDay: 1
	};
	$('.calendar').daterangepicker(options, function(start, end, label) {
	    console.log(start.toISOString(), end.toISOString(), label);
	});
});