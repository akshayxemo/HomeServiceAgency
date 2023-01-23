/**
 * 
 */
function myFunction(){
  var inputDate = new Date(document.getElementById("date").value);
  var date = new Date();
  if(inputDate < date){
	document.getElementById("date").classList.add("is-invalid");
   	return false;
  }else{
    return true;
  }
}
 function validate(event){	
	let dateInput = document.getElementById("date");
	let timeInput = document.getElementById("time");
	let elements = document.getElementsByName("subService");
	let check = false;
	let heading = document.getElementById("serviceHeading");
	
	for(var i=0; i<elements.length; i++){
		if(elements[i].checked == true){
			check = true;
		}
	}
	if(dateInput.value && timeInput.value && check == true && myFunction()){
		document.getElementById("bookingForm").action = "Booking";
		return true;
	}
	else{
		if(check == false){
		alert("Select Atleast one service");
		heading.classList.add("text-danger");
		}
		else{
			heading.classList.remove("text-danger");
		}
		if(!dateInput.value){
			alert("Date field is empty")
			dateInput.classList.add("is-invalid");
		}
		else{
			dateInput.classList.remove("is-invalid");
			if(myFunction() == false){
			alert("Please enter valid date");
			dateInput.classList.add("is-invalid");
			}
			else{
				dateInput.classList.add("border","border-2","border-success","text-success");
			}
		}
		if(!timeInput.value){
			alert("Time field is empty")
			timeInput.classList.add("is-invalid");
		}
		else{
			timeInput.classList.remove("is-invalid");
			timeInput.classList.add("border","border-2","border-success","text-success");
		}
		event.preventDefault();
	}
}