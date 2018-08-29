// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require_tree .

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
      maxlength: 255,
      uniqueness: true
    },
    "user[password]": {
      required: true,
      maxlength: 64
    }
  }, messages: {
    "user[first_name]": {
      required: "is required",
      maxlength: "must less than 25 characters"
    },
     "user[last_name]": {
      required: "is required",
      maxlength: "must less than 25 characters"
    },
    "user[email]": {
      required: "is required",
      email: "Please enter a valid email address",
      maxlength: "must less than 255 characters",
      uniqueness: "must be unique"
    },
    "user[password]": {
      required: "is required",
      maxlength: "must less than 64 characters"
    }
  }
});