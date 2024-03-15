<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/member/logo.jpg">
<link href="${pageContext.request.contextPath}/resources/css/home/home.css" rel="stylesheet">
<title>여기 다 모여 있다, '다모임'</title>
</head>
<jsp:include page="template/header.jsp"/>
	   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">
<body class="d-flex flex-column min-vh-100">

<div style="display: flex; justify-content: center; align-items: center;">
	<div class="row row-cols-1 row-cols-md-4 g-4 mt-12" style="display: flex;" id="main">
	<c:if test="${fn:length(productList)} != null">
		<c:forEach begin="0" end="${fn:length(productList) - 1}" step="1" var="i">
			<div style="border: 0px solid black; width: 100%; height: 100%; border-radius: 30px;" class="shadow p-3" >
					<article>
						<div class="css-f96hxp">
							<h3><b>${menues[i]}</b></h3>
							<button  class="custom-btn btn-7" aria-label="전체 판매 매물 보기 버턴" onclick="location.href ='${pageContext.request.contextPath}${urlList[i].url}'">더보기</button>
						</div>
						<div class="css=1qeni0p">
							<div class="css-1afg07s">
			<c:forEach var="prItem" items="${productList[i]}">
								<div class="col" id="product">
								  <div class="card h-100" onclick="location.href ='${pageContext.request.contextPath}/board/boardDetail?proWr=${prItem.PRO_WR}&proDate=${prItem.PRO_DATE}'">
								    <img src="${pageContext.request.contextPath}/resources/img/uploads/${prItem.IMG_NAME}" class="card-img-top" alt="${sale.IMG_NAME}" alt="..."
								    			onerror="this.src='${pageContext.request.contextPath}/resources/img/common/따봉도치.jpg'">
								    <div class="card-body">
								     <span class="state1">${prItem.PRO_TC_CODE}</span>
								     <span class="state2">${prItem.PRO_TSC_CODE}</span><br>
								     <p class="titleText">${prItem.PRO_NAME}</p>
								  <h5><b>${prItem.PRO_PRICE}원</b></h5>
								    </div>
								  </div>
								</div>
							<!--  -->		
			</c:forEach>	
					</div>	
						</div>
				</article>
			</div>	
		</c:forEach>
	</c:if>			
	</div>
</div>
</body>
<script>
$(()=>{
    $('.titleText').each(function() {
        var text = $(this).text();
        if (text.length > 13) {
            var truncatedText = text.substring(0, 13) + '...';
            $(this).text(truncatedText);
        }
    });
})
</script>
<jsp:include page="template/Footer.jsp"/>
</html>