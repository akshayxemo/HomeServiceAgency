/**
 * 
 */
 let count = 0;
 function Submit(event){
	count += 1;
	if(count > 1){		
		return true;
	}
	else{
		event.preventDefault();
	}
}
function setFormAction2(){
	let form = document.getElementById("SeenResolved");
	form.action = "Admin";
	return true;
}
function setFormAction1(){
	let form = document.getElementById("UnseenResolve");
	form.action = "Admin";
	return true;
}
