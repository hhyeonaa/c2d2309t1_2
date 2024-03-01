// 유효성 검사 메서드
function Validation() {
    // 변수에 저장
    var uid = document.getElementById("MEM_ID")
    var pw = document.getElementById("MEM_PW")
    var cpw = document.getElementById("confirmPw")
    var mail = document.getElementById("mail")
    var name = document.getElementById("MEM_NAME")
    var year = document.getElementById("MEM_BIRTH")
    var hobby = document.getElementsByName("hobby")
    var me = document.getElementById("me")

    //아이디 확인
    if(uid.value.length <4){
        alert("아이디를 4글자 이상 입력하세요.")
        uid.focus();
        return false;
    }
    //아이디 영어 대소문자 확인
    else if(!checkEngNumber(uid.value)){
        alert("영문 대소문자, 숫자만 입력하세요.")
        uid.focus();
        return false;
    }

    //비밀번호 확인
    if(pw.value.length <4){
        alert("비밀번호를 4글자 이상 입력하세요.")
        pw.focus();
        return false;
    }
    //비밀번호 영어 대소문자 확인
    else if(!checkEngNumber(pw.value)){
        alert("영문 대소문자, 숫자만 입력하세요.")
        pw.focus();
        return false;
    }
    //비밀번호와 아이디 비교
    else if(pw.value == uid.value){
        alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
        pw.focus();
        return false;
    }

    //비밀번호 확인
    if(cpw.value !== pw.value){
        alert("비밀번호와 동일하지 않습니다.")
        cpw.focus();
        return false;
    }

    //메일주소 확인
    if(mail.value.length == 0){
        alert("메일주소를 입력하세요.")
        mail.focus();
        return false;
    }

    else if(mail.value.indexOf("@") == -1 || mail.value.indexOf(".") == -1 || mail.value.length <=5){
        alert("잘못된 이메일 형식입니다.")
        mail.focus();
        return false;
    }

    //이름 확인 = 한글과 영어만 가능하도록
    if(uname.value == ""){
        alert("이름을 입력하세요.")
        uname.focus();
        return false;
    }

    else if(!checkKorEng(uname.value)){
        alert("한글, 영어만 입력하세요.")
        uname.focus();
        return false;
    }

//    //생일 확인
//    if(year.value == ""){
//        alert("년도를 입력하세요.")
//        year.focus();
//        return false;
//    }
//
//    else if(!(year.value >=1900 && year.value <= 2050)){
//        alert("년도를 정확하게 입력해주세요.")
//        year.focus();
//        return false;
//    }

    //관심분야 확인
    if(!checkedHobby(hobby)){
        alert("관심분야를 체크하세요.")
        hobby.focus();
        return false;
    }

    //자기소개 확인
    if(me.value.length <= 10){
        alert("자기소개는 최소 10글자를 입력해주세요.")
        me.focus();
        return false;
    }

    // 유효성 문제 없을 시 폼에 submit
    document.joinForm.submit();
}

// 문자열이 영어, 숫자인지 확인하는 메서드 
function checkEngNumber(value){
    var count = 0;

    for(var i=0; i<value.length; i++){
        if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=48 && value.charCodeAt(i)<=57)){
            count += 1;
        }
    }

    //카운트 수와 문자의 길이가 같다면 true
    if(count === (value.length)){
        return true;
    } else{
        return false;
    }
}

//영어, 한글인지(가~힣) 확인
function checkKorEng(value){
    var count = 0;

    for(var i=0; i<value.length; i++){
        console.log(value.charCodeAt(i));
        if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=44032 && value.charCodeAt(i)<=55203)){
            count += 1;
        }
    }

    if(count === (value.length)){
        return true;
    } else{
        return false;
    }
}

//관심분야 체크 확인
function checkedHobby(arr){
    for(var i=0; i<arr.length; i++){
        if(arr[i].checked == true){
            return true;
        }
    }
    return false;
}