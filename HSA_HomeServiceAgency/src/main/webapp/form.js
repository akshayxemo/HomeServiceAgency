	function setValueform(id,fieldId){
    	
		if(id == "rejectBtn"){
			document.getElementById(fieldId).value = "reject";
		}
		else{
			document.getElementById(fieldId).value = "accept";
		}
	}
    function submit(fid){
    	
    	document.getElementById(fid).submit();
    }