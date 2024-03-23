<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scientific Calculator</title>
<style>
    .calculator {
        width: 300px;
        margin: 20px auto;
        border: 1px solid #ccc;
        padding: 10px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    input[type="text"] {
        width: 100%;
        margin-bottom: 10px;
        padding: 5px;
        font-size: 18px;
    }
    input[type="button"] {
        width: 50px;
        height: 50px;
        font-size: 18px;
    }
</style>
</head>
<body>

<div class="calculator">
    <input type="text" id="display" readonly>
    <table>
        <tr>
            <td><input type="button" value="7" onclick="appendToDisplay('7')"></td>
            <td><input type="button" value="8" onclick="appendToDisplay('8')"></td>
            <td><input type="button" value="9" onclick="appendToDisplay('9')"></td>
            <td><input type="button" value="/" onclick="appendToDisplay('/')"></td>
            <td><input type="button" value="sin" onclick="scientific('sin')"></td>
        </tr>
        <tr>
            <td><input type="button" value="4" onclick="appendToDisplay('4')"></td>
            <td><input type="button" value="5" onclick="appendToDisplay('5')"></td>
            <td><input type="button" value="6" onclick="appendToDisplay('6')"></td>
            <td><input type="button" value="*" onclick="appendToDisplay('*')"></td>
            <td><input type="button" value="cos" onclick="scientific('cos')"></td>
        </tr>
        <tr>
            <td><input type="button" value="1" onclick="appendToDisplay('1')"></td>
            <td><input type="button" value="2" onclick="appendToDisplay('2')"></td>
            <td><input type="button" value="3" onclick="appendToDisplay('3')"></td>
            <td><input type="button" value="-" onclick="appendToDisplay('-')"></td>
            <td><input type="button" value="tan" onclick="scientific('tan')"></td>
        </tr>
        <tr>
            <td><input type="button" value="0" onclick="appendToDisplay('0')"></td>
            <td><input type="button" value="." onclick="appendToDisplay('.')"></td>
            <td><input type="button" value="C" onclick="clearDisplay()"></td>
            <td><input type="button" value="+" onclick="appendToDisplay('+')"></td>
            <td><input type="button" value="sqrt" onclick="scientific('sqrt')"></td>
        </tr>
        <tr>
            <td colspan="5"><input type="button" value="=" onclick="calculate()"></td>
        </tr>
    </table>
</div>

<script>
    function appendToDisplay(value) {
        document.getElementById('display').value += value;
    }

    function clearDisplay() {
        document.getElementById('display').value = '';
    }

    function calculate() {
        try {
            var result = eval(document.getElementById('display').value);
            document.getElementById('display').value = result;
        } catch (error) {
            alert('Invalid expression');
        }
    }

    function scientific(func) {
        var val = parseFloat(document.getElementById('display').value);
        var result;
        switch (func) {
            case 'sin':
                result = Math.sin(val * Math.PI / 180);
                break;
            case 'cos':
                result = Math.cos(val * Math.PI / 180);
                break;
            case 'tan':
                result = Math.tan(val * Math.PI / 180);
                break;
            case 'sqrt':
                result = Math.sqrt(val);
                break;
            default:
                result = 0;
        }
        document.getElementById('display').value = result.toFixed(6);
    }
</script>

</body>
</html>
