<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: osk2090
  Date: 2021/05/17
  Time: 11:17 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>클럽 신고게시판</title>
</head>
<body>
<h1>클럽 신고게시판</h1>

<table border='1'>
    <thead>
    <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>신고사유</th>
        <th>처리여부</th>
        <th>신고일자</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${reports}" var="r">
        <tr>
            <td><a href='detail?no=${r.no}'>${r.no}</a></td>
            <td>${r.rtitle}</td>
            <td>${r.reason}</td>
            <td>${r.rresult}</td>
            <td>${r.date}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><a href='add'>목록</a></p>

</body>
</html>