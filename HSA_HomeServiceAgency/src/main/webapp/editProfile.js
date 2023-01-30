function containsOnlyNumbers(str){
    return /^\d+$/.test(str);
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
function passwordFieldCheck(event){
	let pass = document.getElementById("floatingPassword");
	let newPass = document.getElementById("floatingNewPassword");
	let rePass = document.getElementById("floatingRePassword");
	if(pass.value != "" && newPass.value !="" && rePass.value != ""){
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
		if(pass.value == ""){
			pass.classList.add("is-invalid");
		}
		else{
			pass.classList.remove("is-invalid");
		}
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

function submitGeneralForm(event){
	let name = document.getElementById("floatingName");
	let email = document.getElementById("floatingEmail");
	let phone = document.getElementById("floatingPhone");
	let altPh = document.getElementById("floatingAltPhone");
	let address = document.getElementById("floatingAddress");
	let pass = document.getElementById("floatingGPassword");
	//alert("enterw")
	
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
		alert("Field is empty")
		phone.classList.add("is-invalid");
		event.preventDefault();
	}
	
	if(altPh.value != ""){
		if(!containsOnlyNumbers(altPh.value)){
			alert("Phone number should contains only numbers")
			altPh.classList.add("is-invalid");
			altPh.classList.add("is-valid");
			event.preventDefault();
		}
		if(altPh.value.length < 10 || altPh.value.length > 15){
			alert("Phone numbers should 10-15 digit long")
			altPh.classList.add("is-invalid");
			event.preventDefault();
		}
		if(altPh.value.length >= 10 && altPh.value.length <= 15 && containsOnlyNumbers(altPh.value)){
			altPh.classList.remove("is-invalid");
			altPh.classList.add("is-valid");
		}
	}
	
	if(email.value != ""){
		if(!ValidateEmail(email.value)){
			email.classList.add("is-invalid");
			event.preventDefault();
		}
		else{
			email.classList.remove("is-invalid");
			email.classList.add("is-valid");
		}
	}
	else{
		alert("Field is empty")
		email.classList.add("is-invalid");
		event.preventDefault();
	}
	if(name.value != "" && address.value != ""){
		if(pass.value !=""){
			if(pass.value.length >= 6 && pass.value.length <= 8){
				return true;
			}
			else{
				alert("Password must contain 6-8 characters")
				event.preventDefault();
				pass.classList.add("is-invalid");
			}
		}
		else{
			alert("Password field is empty")
			event.preventDefault();
			pass.classList.add("is-invalid");
		}
	}
	else{
		alert("Field is empty")
		event.preventDefault();
		name.classList.add("is-invalid");
		address.classList.add("is-invalid");
	}
	event.preventDefault();
}
let change = document.getElementById("change");
let passwordField = document.getElementById("floatingGPassword");
let generalForm = document.getElementById("generalForm");
function resetbtn(){
	change.disabled = true;
	passwordField.disabled = true;
	generalForm.reset;
}
function check(){
	change.disabled = false;
	passwordField.disabled = false;
}

function updatePreview(input, target) {
    let file = input.files[0];
    let reader = new FileReader();

    reader.readAsDataURL(file);
    reader.onload = function () {
        let img = document.getElementById(target);
        // can also use "this.result"
        img.src = reader.result;
    }
}
function Filevalidation(){
        const fi = document.getElementById("formFileLg");
        // Check if any file is selected.
        if (fi.files.length > 0) {
            for (const i = 0; i <= fi.files.length - 1; i++) {
      
                const fsize = fi.files.item(i).size;
                const file = fsize / 1024;
                // The size of the file.
                if (file > 200) {
                    document.getElementById("sizeP").innerHTML = "size too Big";
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
 function varifyImage(event){
	const fi = document.getElementById("formFileLg").value;
	
	if(fi == ""){
		event.preventDefault();
		document.getElementById("sizeP").innerHTML = "Field is empty";
        document.getElementById("sizeP").style.color = "red";
	}
	else if(!Filevalidation()){
		event.preventDefault();
	}
	else{
		return true;
	}
}