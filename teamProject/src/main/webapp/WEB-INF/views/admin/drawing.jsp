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
        <!-- ���ڰ� ǥ�õǴ� ���� -->
        <div id="number-bead">1</div>

        <!-- �̱� ��ư -->
        <button id="draw-button" onclick="drawBead()">�̱�</button>

        <!-- ���� �̱� Ƚ�� �� ���� Ƚ�� ǥ�� -->
        <p id="draw-count">���� �̱� Ƚ��: 5 / ���� Ƚ��: 0</p>
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

            // ���� Ƚ���� ���� ���� ȹ�� ���� Ȯ��
            checkReward(plus);
            // ������Ʈ �̱� Ƚ��
            updateDrawCount(minus, plus);
        } else {
            alert("���� �̱� Ƚ���� �����ϴ�. ���� �ٽ� �õ����ּ���.");
        }
    }

    function updateDrawCount(remainingDraws, cumulativeDraws) {
        const drawCountElement = document.getElementById("draw-count");
        drawCountElement.innerText = "���� �̱� Ƚ��: " + remainingDraws + " / " + "���� Ƚ��: " + cumulativeDraws;
    }

    function checkReward(plus) {
        // ���� Ƚ���� ���� ���� ȹ�� ���� Ȯ��
        if (cumulativeDraws === 5) {
            alert("�����մϴ�! 5ȸ �������� ������ ȹ���ϼ̽��ϴ�!");
            // ���⿡ 5ȸ ���� ���� ���� ������ �߰��� �� �ֽ��ϴ�.
        } else if (cumulativeDraws === 10) {
            alert("�����մϴ�! 10ȸ �������� ������ ȹ���ϼ̽��ϴ�!");
            // ���⿡ 10ȸ ���� ���� ���� ������ �߰��� �� �ֽ��ϴ�.
        } else if (cumulativeDraws === 15) {
            alert("�����մϴ�! 15ȸ �������� ������ ȹ���ϼ̽��ϴ�!");
            // ���⿡ 15ȸ ���� ���� ���� ������ �߰��� �� �ֽ��ϴ�.
        } else if (cumulativeDraws === 20) {
            alert("�����մϴ�! 20ȸ �������� ������ ȹ���ϼ̽��ϴ�!");
            // ���⿡ 20ȸ ���� ���� ���� ������ �߰��� �� �ֽ��ϴ�.
        }
    }

    function getRandomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }
    </script>
</body>
</html>