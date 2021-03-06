$(document).on('turbolinks:load', function(){
  $("#new_user").validate({
    errorPlacement: function (error, element) {
      error.insertBefore(element);
    },
    rules: {
      "user[first_name]": {
        required: true,
        maxlength: 25
      },
       "user[last_name]": {
        required: true,
        maxlength: 25
      },
      "user[email]": {
        required: true,
        email: true,
        maxlength: 255
      },
      "user[password]": {
        required: true,
        minlength: 6,
        maxlength: 64
      },
      "user[password_confirmation]": {
        required: true,
        equalTo: "#user_password"
      }
    },
    messages: {
      "user[first_name]": {
        required: "(is required)",
        maxlength: "(must less than 25 characters)"
      },
       "user[last_name]": {
        required: "(is required)",
        maxlength: "(must less than 25 characters)"
      },
      "user[email]": {
        required: "(is required)",
        email: "(Please enter a valid email address)",
        maxlength: "(must less than 255 characters)"
      },
      "user[password]": {
        required: "(is required)",
        minlength: "(must more than 6 characters)",
        maxlength: "(must less than 64 characters)"
      },
      "user[password_confirmation]": {
        required: "(is required)",
        equalTo: "(password and password confirmation must be same)"
      }
    }
  });
  $("#edit_user").validate({
    errorPlacement: function (error, element) {
      error.insertBefore(element);
    },
    rules: {
      "user[first_name]": {
        required: true,
        maxlength: 25
      },
       "user[last_name]": {
        required: true,
        maxlength: 25
      },
      "user[email]": {
        required: true,
        email: true,
        maxlength: 255
      },
      "user[current_password]": {
        required: true,
        minlength: 6,
        maxlength: 64
      }
    },
    messages: {
      "user[first_name]": {
        required: "(is required)",
        maxlength: "(must less than 25 characters)"
      },
       "user[last_name]": {
        required: "(is required)",
        maxlength: "(must less than 25 characters)"
      },
      "user[email]": {
        required: "(is required)",
        email: "(Please enter a valid email address)",
        maxlength: "(must less than 255 characters)"
      },
      "user[current_password]": {
        required: "(is required)",
        minlength: "(must more than 6 characters)",
        maxlength: "(must less than 64 characters)"
      }
    }
  });
});
