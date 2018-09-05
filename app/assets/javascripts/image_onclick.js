$(document).on('turbolinks:load', function(){
  $(function() {
      var pathname = window.location.pathname;

      $('.pop').on('click', function() {
        $('.imagepreview').attr('src', $(this).find('img').attr('src'));
        $('#imagemodal').modal('show');
      });

      $('ul.nav>li>a[href="'+pathname+'"]').parent().addClass('active');
  });
});
