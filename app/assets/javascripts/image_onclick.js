$(document).on('turbolinks:load', function(){
  $(function() {
      var pathname = window.location.pathname;
      $('.pop').on('click', function() {
        $('.imagepreview').attr('src', $(this).find('img').attr('src'));
        $('#imagemodal').modal('show');
      });
      // $('.prev').on('click', function(){
      //     var imgPath = current_img.prev().attr('src');
      //     current_img = current_img.prev();
      //     $('.imagepreview').show().find('img').attr('src',imgPath);
      // });
      // $('.next').on('click', function(){
      //         var imgPath = current_img.next().attr('src');
      //         current_img = current_img.next();
      //         $('.imagepreview').show().find('img').attr('src',imgPath);
      // });
      // $(".photo_album ul li").on('click', function(e){
      //   // $(this).parent().find('li.active').removeClass('active');
      //   $(this).css("color", "red");
      // });
      // $(".photo_album>ul>li").on('click', function(e){
      //   var pathname = window.location.pathname;
      //   alert(pathname);
      // });
      // console.log(pathname);
      $('ul.nav>li>a[href="'+pathname+'"]').parent().addClass('active');
  });
});
