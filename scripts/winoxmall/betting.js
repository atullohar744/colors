$(document).ready(function() {

	$("#bettingForm").on('submit', (function(e) {
		e.preventDefault();

		var finalamount = $('input#finalamount').val();
		var counter = $('input#counter').val();
		var inputgameid = $('input#inputgameid').val();
		var tab = $('input#tab').val();

		if ((finalamount) == 0) {

			$('#payment').modal('hide');
			$('#alert').modal({
				backdrop : 'static',
				keyboard : false
			});
			$('#alert').modal('show');
			document.getElementById('alertmessage').innerHTML = "<h4>Fail !</h4><p>Invalid contract count,please try again !</p>";
			return false;
		}
		if (finalamount < 10) {

			$('#payment').modal('hide');
			$('#alert').modal({
				backdrop : 'static',
				keyboard : false
			});
			$('#alert').modal('show');
			document.getElementById('alertmessage').innerHTML = "<h4>Fail !</h4><p>Invalid contract count,please try again !</p>";
			return false;
		}
		if (finalamount > 100000) {

			$('#payment').modal('hide');
			$('#alert').modal({
				backdrop : 'static',
				keyboard : false
			});
			$('#alert').modal('show');
			document.getElementById('alertmessage').innerHTML = "<h4>Fail !</h4><p>Invalid contract count,please try again !</p>";
			return false;
		}

		if (counter < 30) {
			$('#payment').modal('hide');
			$('#alert').modal({
				backdrop : 'static',
				keyboard : false
			});
			$('#alert').modal('show');
			document.getElementById('alertmessage').innerHTML = "<h4>Fail !</h4><p>Invalid period,please try again !</p>";
			return false;
		}

		if (!$('#presalerule').is(':checked')) {
			$('#payment').modal('hide');
			$('#alert').modal({
				backdrop : 'static',
				keyboard : false
			});
			$('#alert').modal('show');
			document.getElementById('alertmessage').innerHTML = "<h4>Fail !</h4><p>Please select presale rule !</p>";
			return false;
		}

		$.ajax({
			type : "POST",
			url : base + "inc/join.php",
			data : new FormData(this),
			contentType : false,
			cache : false,
			processData : false,
			success : function(html) {
				$('#payment').modal('hide');
				$('#alert').modal({
					backdrop : 'static',
					keyboard : false
				});
				myRecords();
				$('#alert').modal('show');
				document.getElementById('alertmessage').innerHTML = html;
				return false;
			}
		});
	}));

	//=============================payment detail=========================================================================

});

function declareResult() {
	var futureid = $('#futureid').val();
	$.ajax({
		type : 'POST',
		url : base + 'inc/ajax.php?mode=declare&futureid=' + futureid,
		success : function() {
		}
	});
}

function loadResult(){
	$.ajax({
		type : 'POST',
		url : base + 'results',
		success : function(html) {
			$('div#parityt_wrapper').html(html);
			
			$('#emerdt').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : false,
				"info" : true,
				"autoWidth" : false
			});
		}
	});
}

function myRecords(){
	var futureid = $('#futureid').val();
	$.ajax({
		type : 'POST',
		url : base + 'records?futureid=' + futureid,
		success : function(html) {
			$('div#myrecordparityt_wrapper').html(html);
			
			$('#myRecords').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : false,
				"info" : true,
				"autoWidth" : false
			});
			
			loadResult();
		}
	});
}

function waitlist(category, userid, containerid) {//alert(containerid);
	var inputgameid = $("#futureid").val();

	$.ajax({
		type : "Post",
		data : "category=" + category + "& userid=" + userid + "& periodid=" + inputgameid,
		url : "getwaitlist.php",
		success : function(html) {//alert(html);
			document.getElementById(containerid).innerHTML = html;
		},
		error : function(e) {
		}
	});
}