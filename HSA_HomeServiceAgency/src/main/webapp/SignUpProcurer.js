/**
 * 
 */
function containsOnlyNumbers(str){
    return /^\d+$/.test(str);
}
 //MODAL popup for alert info
function openModal(msg) {
    document.getElementById("alertModal").style.display = "block";
    document.getElementById("modalBody").innerHTML = msg;
}
function closeModal() {
    document.getElementById("alertModal").style.display = "none";
}

//Check image file size <= 200 kb or not
function Filevalidation(){
        const fi = document.getElementById("formFileLg");
        // Check if any file is selected.
        if (fi.files.length > 0) {
            for (const i = 0; i <= fi.files.length - 1; i++) {
      
                const fsize = fi.files.item(i).size;
                const file = fsize / 1024;
                // The size of the file.
                if (file > 200) {
                    document.getElementById("sizeP").innerHTML = "Image size too Big, please select a file less than 200kb";
                    document.getElementById("sizeP").style.color = "red";
                    return false;
                } else {
                    document.getElementById("sizeP").innerHTML = "size: "
                    + file.toFixed(2) + "KB";
                    document.getElementById("sizeP").style.color = "green";
                    return true;
                }
            }
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
		alert("Password should contain atleast 6 characters and atmost 8 characters");
		return false;
	}
	
}

//Email id is valid kind or not checking
function ValidateEmail(email){
		//var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
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
function focusUncheckedFields(id){
	//name
	if(document.getElementById(id).value==""){
			document.getElementById(id).style.borderColor="red";
	}
	else{
		document.getElementById(id).style.borderColor="#ced4da";
	}
}
function bulkFocusUncheckedFields(){
		focusUncheckedFields("fullName");
		focusUncheckedFields("address");
		focusUncheckedFields("emailAddress");
		focusUncheckedFields("phoneNumber");
		focusUncheckedFields("password");
		focusUncheckedFields("Cpassword");
		focusUncheckedFields("formFileLg");
}

//Checking fields are empty or not
function checkFields(event){
	let name = document.forms["User_signup"]["UName"].value
	let address = document.forms["User_signup"]["UAddress"].value
	let email = document.forms["User_signup"]["UEmail"].value
	let gender = document.forms["User_signup"]["inlineRadioOptions"].value
	let phone  = document.forms["User_signup"]["Phone"].value
	let password = document.forms["User_signup"]["Password"].value
	let confirmPassword = document.forms["User_signup"]["ConfirmPass"].value
	let image = document.forms["User_signup"]["UImage"].value
	let altPhone =  document.forms["User_signup"]["AltPhone"].value
	    
	if(phone != ""){
		if(!containsOnlyNumbers(phone)){
			openModal("Phone Number should contain digits only [0-9]");
			document.getElementById("phoneNumber").value = "";
			focusUncheckedFields("phoneNumber");
			event.preventDefault();
		}
		if(phone.length < 10 || phone.length > 15){
			openModal("Phone Number should contain 10-15 digits");
			document.getElementById("phoneNumber").value = "";
			focusUncheckedFields("phoneNumber");
			event.preventDefault();
		}
	}
	
	if(altPhone !=""){
		if(!containsOnlyNumbers(altPhone)){
			openModal("Alternate Phone Number should contain digits only [0-9]");
			document.getElementById("altphoneNumber").value = "";
			focusUncheckedFields("altphoneNumber");
			event.preventDefault();
		}
		if(altPhone.length < 10 || altPhone.length > 15){
			openModal("Alternate Phone Number should contain 10-15 digits");
			document.getElementById("altphoneNumber").value = "";
			focusUncheckedFields("altphoneNumber");
			event.preventDefault();
		}
	}
	
	
	if(name != "" && address != "" && email != "" && gender != "" && phone != "" && password != "" && confirmPassword != "" && image != ""){
		if(passwordValidation(password,confirmPassword) && Filevalidation() && ValidateEmail(email))
		{
			document.getElementById("Signupform").action = "UserSignup";
			return true;
		}		
		else{
			if(!Filevalidation()){
				openModal("Image file is too Big, please select a file less than 200kb");
				focusUncheckedFields("formFileLg");
			}
			focusUncheckedFields("password");
			focusUncheckedFields("Cpassword");
			focusUncheckedFields("emailAddress");
			document.getElementById("password").value="";
			document.getElementById("Cpassword").value="";
			document.getElementById("emailAddress").value="";
			event.preventDefault();
		}
			
	}
	else{
		openModal("Required fields must be filled in before submitting");
		bulkFocusUncheckedFields();
		event.preventDefault();
	}
	
}