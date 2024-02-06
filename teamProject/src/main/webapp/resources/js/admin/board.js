document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

$(function(){
	var modal = document.getElementById("inputModal");
	var btn = document.getElementById("insertForm");
	var span = document.getElementsByClassName("close")[0];
	var cancelBtn = document.getElementById("cancelBtn");
	
	$('#insertForm').on('click', function(){
		modal.style.display = "block";	
	})
	
	$('#close').on('click', function(){
		modal.style.display = "none";
	})
	
	$('#cancelBtn').on('click', function(){
		modal.style.display = "none";
	})
	
	$('#deleteBtn').on('click', function(){
	})
	
});

$(() => {
	paging("#tbody tr", 5, 0);

})