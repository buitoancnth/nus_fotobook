$(document).on('turbolinks:load', function(){
  $(function() {
    var pathname = window.location.pathname;

    $('.post-image').on('click', function() {
      $('.imagepreview').attr('src', $(this).find('img').attr('src'));
      $('h4.modal-title').text($(this).find('h5.post-title').text());
      $('h6.modal-description').text($(this).find('h6.post-description').text());
      $('#imagemodal').modal('show');
      current_img = $(this).find('img.gallery-hide');
      $('.prev').on('click', function(){
        if (current_img.prev().length > 1) {
          var imgPath = current_img.prev().attr('src');
          current_img = current_img.prev();
          $('.imagepreview').attr('src', imgPath);
        }
      });
      $('.next').on('click', function(){
        if (current_img.next().length > 1) {
          var imgPath = current_img.next().attr('src');
          current_img = current_img.next();
          $('.imagepreview').attr('src', imgPath);
        }
      });
    });

    $('ul.nav>li>a[href="'+pathname+'"]').parent().addClass('active');

    if ($('img#photo-edit').attr('src')!='#'){
      $('.file-upload-content').show();
      $('.image-upload-wrap').hide();
    };

    $('#image-photo').on('click', function () {
      $('#photo_image').trigger('click');
    });
    $('#photo_image').on('change', function (e) {
      for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
        var file = e.originalEvent.srcElement.files[i];
        var reader = new FileReader();
        reader.onloadend = function() {
          $('.image-upload-wrap').hide();
          $('.file-upload-image').attr('src', reader.result);
          $('.file-upload-content').show();
        };
        reader.readAsDataURL(file);
      }
    });

    $('#image-album').on('click', function () {
      $('#album_images').trigger('click');
    });

    $('#album_images').on('change', function (e) {
      html = "";
      var div = document.createElement('div');
      div.className = 'album-upload';
      for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
        var file = e.originalEvent.srcElement.files[i];
        var reader = new FileReader();
        reader.onloadend = function(e) {
          var file = e.target;
          html += "<div class='album-element'><img src ='"+ file.result +"' class ='thumbnail'/><span class='glyphicon glyphicon-remove albums-insert'></span></div>";
          div.innerHTML = html;
        };
        reader.readAsDataURL(file);
      }
      $(div).insertBefore('.upload-album');
    });

    $('#remove-image').not("span").on('click', function(){
      $('#photo_image').val("");
      $('.file-upload-content').hide();
      $('.image-upload-wrap').show();
    });

    $('.thumbnail-photo').on('click', function(e) {
      console.log('vao day');
      $('.imagepreview').attr('src', $(this).find('img').attr('src'));
      $('h4.modal-title').text($(this).find('.caption p').text());
      $('h6.modal-description').text($(this).find('h6.description-hidden').text());
      $('#imagemodal').modal('show');
    });
    $('.glyphicon-edit').on('click', function(e){
      e.stopPropagation();
    });
  });
});
