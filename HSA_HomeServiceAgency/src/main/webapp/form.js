	function setValueform(id,fieldId){
    	alert(id)
    	alert(fieldId)
		if(id == "rejectBtn"){
			document.getElementById(fieldId).value = "reject";
		}
		else{
			document.getElementById(fieldId).value = "accept";
		}
	}
    function submit(fid){
    	alert(fid)
    	document.getElementById(fid).submit();
    }