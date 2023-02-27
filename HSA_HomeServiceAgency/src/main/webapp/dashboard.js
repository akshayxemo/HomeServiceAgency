/**
 * 
 */
 //MODAL ALERT
    
	function openModal(msg) {
	    document.getElementById("alertModal").style.display = "block";
	    document.getElementById("modalBody").style.color = "#dc3545";
	    document.getElementById("modalBody").innerHTML = msg;
	}
	function closeModal() {
	    document.getElementById("alertModal").style.display = "none";
	}
 
	function validate(event, fieldId){
	let pass = document.getElementById(fieldId);
	
	if(pass.value == ""){
		event.preventDefault();
		openModal("You must give your password");
		pass.classList.add("is-invalid");
	}
	else{
		return true;
	}
	
	}