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
 
 function setValue(id){
	if(id == "rejectBtn"){
		document.getElementById("F-action").value = "reject"
	}
	else{
		document.getElementById("F-action").value = "accept"
	}
}
function validate(event){
	let pass = document.getElementById("profPass");
	
	if(pass.value == ""){
		event.preventDefault();
		openModal("You must give your password");
		pass.classList.add("is-invalid");
	}
	else{
		return true;
	}
	
}