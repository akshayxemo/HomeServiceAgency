function containsOnlyNumbers(str){
		    return /^\d+$/.test(str);
		}
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
		function warning(id,type){
			if(type == ""){
				alert("Select account Type")
				document.getElementById(id).style.color ="#dc3545";
			}
			else{
				document.getElementById("AcTypeHeadline").style.color ="black";
			}
		}
		function validation(event){
			let email = document.getElementById("floatingEmail");
			let phone = document.getElementById("floatingPhone");
			let type = document.forms["recovery"]["AccountType"].value
			let radio = document.querySelector('input[type=radio][name=AccountType]:checked');
			
			if(phone.value != ""){
				if(!containsOnlyNumbers(phone.value)){
					alert("Phone number should contains only numbers")
					phone.classList.add("is-invalid");
					event.preventDefault();
				}
				if(phone.value.length < 10 || phone.value.length > 15){
					alert("Phone numbers should 10-15 digit long")
					phone.classList.add("is-invalid");
					event.preventDefault();
				}
				if(phone.value.length >= 10 && phone.value.length <= 15 && containsOnlyNumbers(phone.value)){
					phone.classList.remove("is-invalid");
					phone.classList.add("is-valid");
				}
			}
			else{
				phone.classList.add("is-invalid");
				event.preventDefault();
			}
			
			if(email.value != "" && ValidateEmail(email.value) && type != ""){
					return true;
			}
			else{
				event.preventDefault();
				alert("Fill all fields")
				email.classList.add("is-invalid");
				phone.classList.add("is-invalid");
				warning("AcTypeHeadline",type);
				radio.checked = false;
				alert("Please enter your email");
			}
		}
		
		//Check password and confirm password are matching or not         
		function passwordValidation(password, confirmPassword){
			if(password.length>=6 && password.length<=8){
				if(password == confirmPassword){
					return true;
				}
				else{
					alert("Password not matched");
					return false;
				}
			}
			else{
				alert("Password should contain atleast 6 characters");
				return false;
			}
			
		}
		function passwordFieldCheck(event){
		let newPass = document.getElementById("floatingPassword");
		let rePass = document.getElementById("floatingCPassword");
		if(newPass.value !="" && rePass.value != ""){
			if( passwordValidation(newPass.value, rePass.value)){
				return true;
			}
			else{
				event.preventDefault();
				newPass.classList.add("is-invalid");
				rePass.classList.add("is-invalid");
			}
		}
		else{
			event.preventDefault();
			alert("Fill the password fields");
			if(newPass.value == ""){
				newPass.classList.add("is-invalid");
			}
			else{
				newPass.classList.remove("is-invalid");
			}
			if(rePass.value == ""){
				rePass.classList.add("is-invalid");
			}
			else{
				rePass.classList.remove("is-invalid");
			}
			document.getElementById("emptyPass").innerHTML = "Fields are empty";
	        document.getElementById("emptyPass").style.color = "red";
		}
	}