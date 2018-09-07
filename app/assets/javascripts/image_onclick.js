$(document).on('turbolinks:load', function(){
  $(function() {
      var pathname = window.location.pathname;

      $('.pop').on('click', function() {
        $('.imagepreview').attr('src', $(this).find('img').attr('src'));
        $('#imagemodal').modal('show');
      });

      $('ul.nav>li>a[href="'+pathname+'"]').parent().addClass('active');
      $('#click_id').on('click', function () {
        $('#photo_image').trigger('click');
      });
      $('#click_id').on('change', function (e) {
        for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
          var file = e.originalEvent.srcElement.files[i];
          var img = document.createElement("img");
          var reader = new FileReader();
          reader.onloadend = function() {
            $('.image-upload-wrap').hide();
            $('.file-upload-image').attr('src', reader.result);
            $('.file-upload-content').show();
            $('.image-title').html(file.name);
          };
          reader.readAsDataURL(file);
        }
      });
      $('#remove-image').on('click', function(){
        $('#photo_image').val("");
        $('#click_id').val("");
        $('.file-upload-content').hide();
        $('.image-upload-wrap').show();
      });
  });
});
