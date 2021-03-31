$(function () {
  function readURL(input) {
    if (input.files) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.image-top').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('.img_field').change(function () {
    readURL(this);
  });
});