<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공연장 등록</title>
        <%@ include file="../inc/head.jsp"%>
    </head>
    <body>
    	<jsp:include page="../inc/header.jsp"></jsp:include>
        <form action="/hall/insert.do" method="post">
            hall name<input type="text" name="hallName" id=""> <br>
            hall space name <input type="text" name="hallSpaceName" id=""><br>
            hall address <input type="text" name="hallAddress" id=""><br>
            hall people <input type="text" name="hallPeople" id=""><br>
            hall fee <input type="text" name="hallFee" id=""><br>
            hall caution <input type="text" name="hallCautions" id=""><br>
            hall refunds <input type="text" name="hallRefunds" id=""><br>
            hall agent name <input type="text" name="hallAgentName" id=""><br>
            hall agent phone <input type="text" name="hallAgentPhone" id=""><br>
            hall agent email <input type="text" name="hallAgentEmail" id=""><br>
            hall x <input type="text" name="hallX" id=""><br>
            hall y <input type="text" name="hallY" id=""><br>
            <input type="submit" value="입력">
        </form>
        <jsp:include page="../inc/footer.jsp"></jsp:include>
    </body>
</html>