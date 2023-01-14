//Email format validate
	function ValidateEmail(email){
		let mailformat = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(!email.match(mailformat))
		{
			alert("You have entered an invalid email address!");
			return false;
		}
		else{
			return true;
		}
	}
	
	//Password validate
	function passwordValidation(password){
		if(password.length>=6 && password.length<=8){
			return true;
		}
		else{
			alert("Password should contain atleast 6 characters and atmost 8 characters");
			return false;
		}
		
	}
	//MODAL ALERT
	function openModal(msg) {
	    document.getElementById("alertModal").style.display = "block";
	    document.getElementById("modalBody").style.color = "#dc3545";
	    document.getElementById("modalBody").innerHTML = msg;
	}
	function closeModal() {
	    document.getElementById("alertModal").style.display = "none";
	}
	
	//Focus on wrong
	function focusUncheckedFields(id){
		//name
		if(document.getElementById(id).value==""){
				document.getElementById(id).classList.add("is-invalid");
		}
		else{
			document.getElementById(id).classList.remove("is-invalid");
		}
	}
	function warning(id,type){
		if(type == ""){
			document.getElementById(id).style.color ="#dc3545";
		}
		else{
			document.getElementById("AcTypeHeadline").style.color ="black";
		}
	}
	
	//MAIN VALIDATION
	function checkFields(event){
		let email = document.getElementById("floatingEmail").value
		let type = document.forms["login"]["AccountType"].value
		let password = document.getElementById("floatingPassword").value
		let radio = document.querySelector('input[type=radio][name=AccountType]:checked');
		
		if(email != "" && type != "" && password != ""){
			if(ValidateEmail(email) && passwordValidation(password))
			{
				document.getElementById("Loginform").action = "Login";
				return true;
			}		
			else{
				document.getElementById("floatingPassword").value="";
				document.getElementById("floatingEmail").value="";
				radio.checked = false;
				focusUncheckedFields("floatingPassword");
				focusUncheckedFields("floatingEmail");
				event.preventDefault();
			}
				
		}
		else{
			openModal("Required fields must be filled");
			warning("AcTypeHeadline",type);
			focusUncheckedFields("floatingPassword");
			focusUncheckedFields("floatingEmail");
			event.preventDefault();
		}
		
	}
/**
 * 
 */