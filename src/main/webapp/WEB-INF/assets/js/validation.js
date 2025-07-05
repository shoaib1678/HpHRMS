
        
        /*Only Characters are allowed */
        $(function () {
            $(".name").keypress(function (e) { 
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[A-Za-z. ]+$/;
    
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });

        /*Only Mobile Number are allowed */
        $(function () {
            $(".number").keypress(function (e) { 
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[0-9]+$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                var value = $(this).val();
                if(value.length > 9)
                {
                    e.preventDefault();
                }
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });

        /*Integer and decimal number both are allowed*/
         $(function () {
            $(".number_decimal").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[0-9. ]+$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });
		 /*Only numbers are allowed*/
			 $(function () {
            $(".numberAllowed").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
    
                var regex = /^[0-9]+$/;
    
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                   e.preventDefault();
                } 
    
                return isValid;
             })
         });



        /*Only email are allowed */
         $(function () {
            $(".email").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                 var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.escapeSelector(keyCode));
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });

	

        /*Only Characters and Number are allowed */
        $(function () {
            $(".alphaNumeric").keypress(function (e) { 
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[A-Za-z0-9 ]+$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });
        
        /*Only Characters and Number are allowed */
        $(function () {
            $(".alphaNumericwithspacial").keypress(function (e) { 
                var keyCode = e.keyCode || e.which;
    
                 /* $("#lblError").html(""); */
    
                //Regex for Valid Characters i.e. Alphabets.
                var regex = /^[-A-Za-z0-9 .& ]+$/;
    
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                /* if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                } */
    
                return isValid;
             })
         });
        
        $(document).ready(function(){     
            
        	$(".pan").change(function () {      
        	var inputvalues = $(this).val();      
        	  var regex = /[A-Z]{5}[0-9]{4}[A-Z]{1}$/;    
        	  if(!regex.test(inputvalues)){      
        	  $(".pan").val("");    
        	  alert("invalid PAN no");    
        	  return regex.test(inputvalues);    
        	  }    
        	});      
        	    
        });
        $(document).ready(function(){     
        	
        	$('.pincode').keypress(function(e) {
            	
                var a = [];
                var k = e.which;

                for (i = 48; i<=58; i++)
                    a.push(i);
                

                if (!(a.indexOf(k)>=0))
                    e.preventDefault();
                	
            });
        });
          
 




	