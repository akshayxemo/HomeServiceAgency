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
	let rating = document.forms["acceptForm"]["rating"].value
	let ratingcheck = document.querySelector('input[type=radio][name=rating]:checked');
	let pass = document.getElementById("profPass");
	
	if(rating == ""){
		openModal("User must give a rating to the professional");
		pass.classList.remove("is-invalid");
	}
	if(pass.value == ""){
		event.preventDefault();
		openModal("Professional must give password and user must give a rating");
		pass.classList.add("is-invalid");
		ratingcheck.checked = false;
	}
	else{
		return true;
	}
	
}