
$(function() {
  $("form[name='registration']").validate({   
    rules: {
      contactName: "required",
      contactNumber:"required",
     contactEmail: {
        required: true,
        email: true
      },
      
    },
    // Specify validation error messages
    messages: {
      contactName:"Please enter your firstname",
      contactNumber:"Please enter your contactNumber:",
      contactEmail: "Please enter a valid email address"
    },
    submitHandler: function(form) {
      form.submit();
    }
  });
});

