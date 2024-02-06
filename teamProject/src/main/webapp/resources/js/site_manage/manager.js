document.write('<script type="text/javascript"' + 
			    	'src="/' + window.location.pathname.split("/")[1] + '/resources/js/common/variableCode.js">' +
			   '</script>');

$(function(){
	var modal = document.getElementById("addModal");
	var btn = document.getElementById("btnAdd");
	var span = document.getElementsByClassName("close")[0];
	var cancelBtn = document.getElementById("cancelBtn");
	
	$('#btnAdd').on('click', function(){
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
	debugger;
	paging("#tbody tr", 5, 0);

})