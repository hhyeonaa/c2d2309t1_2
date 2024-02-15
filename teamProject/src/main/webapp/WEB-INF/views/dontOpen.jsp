<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="template/header.jsp"/>
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
		<div style="border: 1px solid black; width: 100%; height: 1000px;" >
		
		
			
			<div id="grid"></div>
		
		
		</div>
	</div>
</div>


<script>
var data = [];	
for (let i = 0; i < 10; i++) {
    data.push({
    	name: 'Beautiful Lies',
        artist: 'Birdy',
        release: '2016.03.26',
        genre: i
    });
};

const Grid = tui.Grid;
const instance = new Grid({
	  el: document.getElementById('grid'), // Container element
	  columns: [
	    {
	      header: 'Name',
	      name: 'name'
	    },
	    {
	      header: 'Artist',
	      name: 'artist',
	      editor: 'text'
	    },
	    {
	      header: 'Release',
	      name: 'release'
	    },
	    {
	      header: 'Genre',
	      name: 'genre'
	    }
	  ],
	  data: data
	});

	instance.resetData(newData); // Call API of instance's public method

	Grid.applyTheme('striped'); // Call API of static method
</script>
</body>
<jsp:include page="template/Footer.jsp"/>
</html>