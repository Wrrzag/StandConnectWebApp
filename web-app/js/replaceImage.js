$(document).ready(function(){
    $("#imageControl").show();
    $("#imageInput").hide();
    $("#image").prop("disabled", true);

    $("#replaceImage").on("change", function() {
    	if($(this).prop("checked")){
            $("#imageInput").show(500);
            $("#image").prop("disabled", false);
    	}
    	else {
            $("#imageInput").hide(500);
            $("#image").prop("disabled", true);
        }
    });
});