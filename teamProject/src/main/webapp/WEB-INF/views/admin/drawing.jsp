<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Number Bead Drawer</title>
    <style>
    	body {
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    background-color: #f5f5f5;
}

#bead-container {
    text-align: center;
}

#number-bead {
    font-size: 2em;
    font-weight: bold;
    padding: 10px;
    margin: 10px;
    border: 2px solid #333;
    background-color: #fff;
    cursor: pointer;
}

#draw-button {
    font-size: 1em;
    padding: 10px;
    margin: 10px;
    cursor: pointer;
}

#draw-count {
    font-size: 1em;
    margin-top: 10px;
    color: #333;
}
    </style>
</head>
<body>
    <div id="bead-container">
        <!-- 숫자가 표시되는 구슬 -->
        <div id="number-bead">1</div>

        <!-- 뽑기 버튼 -->
        <button id="draw-button" onclick="drawBead()">뽑기</button>

        <!-- 남은 뽑기 횟수 및 누적 횟수 표시 -->
        <p id="draw-count">남은 뽑기 횟수: 5 / 누적 횟수: 0</p>
    </div>

    <script type="text/javascript">
    let remainingDraws = 5;
    let cumulativeDraws = 0;

    document.getElementById("draw-button").addEventListener("click", drawBead);

    function drawBead() {
        if (remainingDraws > 0) {
            const randomNumber = getRandomNumber(1, 100);
            document.getElementById("number-bead").innerText = randomNumber;
            var minus = remainingDraws--;
            var plus = cumulativeDraws++;

            // 누적 횟수에 따라 보상 획득 여부 확인
            checkReward(plus);
            // 업데이트 뽑기 횟수
            updateDrawCount(minus, plus);
        } else {
            alert("남은 뽑기 횟수가 없습니다. 내일 다시 시도해주세요.");
        }
    }

    function updateDrawCount(remainingDraws, cumulativeDraws) {
        const drawCountElement = document.getElementById("draw-count");
        drawCountElement.innerText = "남은 뽑기 횟수: " + remainingDraws + " / " + "누적 횟수: " + cumulativeDraws;
    }

    function checkReward(plus) {
        // 누적 횟수에 따라 보상 획득 여부 확인
        if (cumulativeDraws === 5) {
            alert("축하합니다! 5회 누적으로 보상을 획득하셨습니다!");
            // 여기에 5회 누적 보상에 대한 로직을 추가할 수 있습니다.
        } else if (cumulativeDraws === 10) {
            alert("축하합니다! 10회 누적으로 보상을 획득하셨습니다!");
            // 여기에 10회 누적 보상에 대한 로직을 추가할 수 있습니다.
        } else if (cumulativeDraws === 15) {
            alert("축하합니다! 15회 누적으로 보상을 획득하셨습니다!");
            // 여기에 15회 누적 보상에 대한 로직을 추가할 수 있습니다.
        } else if (cumulativeDraws === 20) {
            alert("축하합니다! 20회 누적으로 보상을 획득하셨습니다!");
            // 여기에 20회 누적 보상에 대한 로직을 추가할 수 있습니다.
        }
    }

    function getRandomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }
    </script>
</body>
</html>