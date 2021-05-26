<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>클럽 신고</title>
</head>
<body>
<h1>클럽 상세보기</h1>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<c:if test="${not empty club}">
<!--클럽신고 관련-->
<c:if test="${not empty loginUser and loginUser.no != club.writer.no}">
    <form action="report" method="post">
        <input type="text" name="no" value="${club.no}" hidden>
        <input type="text" name="clubWriterNo" value="${club.writer.no}" hidden>
        <input type="submit" value="클럽 신고">
    </form>
</c:if>

    <form action='update' method='post'>
        <table border='1'>
            번호: <input type='text' name='no' value='${club.no}' readonly><br>
            방장: <input type='text' name='writer' value='${club.writer.name}' readonly><br>
            도착지: <input type='text' name='arrive' value='${club.arrive}' readonly><br>
            가는날: <input type='date' name='startDate' value='${club.startDate}' readonly><br>
            오는날: <input type='date' name='endDate' value='${club.endDate}' readonly><br>
            테마: <input name='theme' id="themeid" value='${club.theme}' readonly><br>
            제목: <input type='text' name='title' value='${club.title}'><br>
            내용: <textarea name='content' rows='10' cols='60'>${club.content}</textarea><br>
                <tfoot>
                <tr>
                    <td colspan='2'>
                        <input type='submit' value='신고'>
                    </td>
                </tr>
                </tfoot>
            </c:if>
        </table>
    </form>
<p><a href='list'>목록</a></p>
</body>
</html>