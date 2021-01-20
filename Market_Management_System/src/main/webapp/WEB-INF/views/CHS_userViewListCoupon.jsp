<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table>
        <c:forEach items="${ucvList}" var="ucvList">
            <tr>
                <td><a href = "./userViewOneCoupon.do?cseq=${ucvList.cseq}"><img src = "${pageContext.request.contextPath}${ucvList.cthumbimg}" ></a></td>
            </tr>
            <tr>
                <td>${ucvList.cnotify}</td>
            </tr>
            <tr>
                <td>
                    <fmt:parseDate var="startDate" value="${ucvList.cdate}" pattern="yyyy-MM-dd" />
                    <fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/>
                    ~
                    <fmt:parseDate var="endDate" value="${ucvList.clastdate}" pattern="yyyy-MM-dd" />
                    <fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
<%@ include file="./footer.jsp" %>
</html>