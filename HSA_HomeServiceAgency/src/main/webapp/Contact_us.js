function validate(event){
	let textarea = document.getElementById("text");
	if(textarea.value == ""){
		alert("feedback is empty")
		event.preventDefault();
	}
	else{
		document.getElementById("feedbackForm").action = "Contact_us";
		return true;
	}
}

