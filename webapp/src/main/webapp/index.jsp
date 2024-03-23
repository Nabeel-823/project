<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sudoku Game</title>
<style>
    table {
        border-collapse: collapse;
        margin: 20px auto;
    }
    td {
        width: 30px;
        height: 30px;
        border: 1px solid black;
        text-align: center;
    }
    input {
        width: 30px;
        height: 30px;
        border: none;
        text-align: center;
        font-size: 16px;
    }
    .error {
        color: red;
    }
</style>
</head>
<body>

<h1>Sudoku Game</h1>

<form method="post">
    <table>
        <c:forEach var="row" begin="0" end="8">
            <tr>
                <c:forEach var="col" begin="0" end="8">
                    <td>
                        <c:set var="value" value="${board[row][col]}" />
                        <c:choose>
                            <c:when test="${value == 0}">
                                <input type="text" name="cell${row}${col}" maxlength="1"
                                    pattern="[1-9]" title="Enter a single digit (1-9)">
                            </c:when>
                            <c:otherwise>
                                ${value}
                            </c:otherwise>
                        </c:choose>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    <input type="submit" value="Check Solution">
</form>

<c:if test="${not empty errorMessage}">
    <p class="error">${errorMessage}</p>
</c:if>

</body>
</html>
