/**
 * 
 */
 
 function questionCheck() {
	
	if(document.question_frm.qcontent.value.length == 0) {
		alert("질문내용은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.question_frm.qemail.value.length == 0) {
		alert("이메일은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	
	document.question_frm.submit();
	
}

