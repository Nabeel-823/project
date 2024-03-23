<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Snake Game</title>
<style>
    #game-board {
        width: 400px;
        height: 400px;
        border: 1px solid black;
        position: relative;
    }
    .snake-part, .food {
        width: 20px;
        height: 20px;
        position: absolute;
    }
    .snake-part {
        background-color: green;
    }
    .food {
        background-color: red;
    }
</style>
</head>
<body>
<h1>Snake Game</h1>
<div id="game-board"></div>

<script>
    var canvas = document.getElementById('game-board');
    var ctx = canvas.getContext('2d');

    var snake = [{x: 200, y: 200}, {x: 190, y: 200}, {x: 180, y: 200}];
    var dx = 10;
    var dy = 0;
    var foodX;
    var foodY;
    var score = 0;

    function drawSnake() {
        snake.forEach(drawSnakePart);
    }

    function drawSnakePart(snakePart) {
        ctx.fillStyle = 'green';
        ctx.fillRect(snakePart.x, snakePart.y, 10, 10);
    }

    function drawFood() {
        ctx.fillStyle = 'red';
        ctx.fillRect(foodX, foodY, 10, 10);
    }

    function moveSnake() {
        const head = {x: snake[0].x + dx, y: snake[0].y + dy};
        snake.unshift(head);
        if (head.x === foodX && head.y === foodY) {
            score += 10;
            document.getElementById('score').innerText = score;
            generateFood();
        } else {
            snake.pop();
        }
    }

    function generateFood() {
        foodX = Math.floor(Math.random() * canvas.width / 10) * 10;
        foodY = Math.floor(Math.random() * canvas.height / 10) * 10;
        snake.forEach(part => {
            if (part.x === foodX && part.y === foodY) {
                generateFood();
            }
        });
    }

    function clearCanvas() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
    }

    function main() {
        clearCanvas();
        drawFood();
        drawSnake();
        moveSnake();
        if (isGameOver()) {
            alert('Game Over! Your Score: ' + score);
            document.location.reload();
        }
    }

    function isGameOver() {
        for (let i = 4; i < snake.length; i++) {
            if (snake[i].x === snake[0].x && snake[i].y === snake[0].y) {
                return true;
            }
        }
        return (
            snake[0].x < 0 || 
            snake[0].x >= canvas.width || 
            snake[0].y < 0 || 
            snake[0].y >= canvas.height
        );
    }

    document.addEventListener('keydown', function(event) {
        const keyPressed = event.key;
        if (keyPressed === 'ArrowLeft' && dx === 0) {
            dx = -10;
            dy = 0;
        }
        if (keyPressed === 'ArrowRight' && dx === 0) {
            dx = 10;
            dy = 0;
        }
        if (keyPressed === 'ArrowUp' && dy === 0) {
            dx = 0;
            dy = -10;
        }
        if (keyPressed === 'ArrowDown' && dy === 0) {
            dx = 0;
            dy = 10;
        }
    });

    generateFood();
    setInterval(main, 100);
</script>

<p>Score: <span id="score">0</span></p>
</body>
</html>
