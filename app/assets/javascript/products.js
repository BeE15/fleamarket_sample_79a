$(function() {
  
  function buildHTML0(image) {
    var html = `<div class="prev-content">
                  <img src="${image}" alt="preview" class="prev-image0">
                  <div>
                    <a class="deletebtn0">削除<a/>
                  </div>
                </div>`
    return html;
  }

  function buildHTML1(image) {
    var html = `<div class="prev-content">
                  <img src="${image}" alt="preview" class="prev-image1">
                  <div>
                    <a class="deletebtn1">削除<a/>
                  </div>
                </div>`
    return html;
  }

  function buildHTML2(image) {
    var html = `<div class="prev-content">
                  <img src="${image}" alt="preview" class="prev-image2">
                  <div>
                    <a class="deletebtn2">削除<a/>
                  </div>
                </div>`
    return html;
  }
  

  $(document).on("click", '.deletebtn0a', function() {
    $('.prev-image0a').hide();
    var target_image = $(this).parent().parent()
    target_image.hide();
  });
  $(document).on('change', '.js-file0', function() {
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      $('.prev-image0a').hide();
      var target_image = $('.deletebtn0a').parent().parent()
      target_image.hide();
      const targetIndex = $('.hidden-destroy0').data('index')
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy0`);
      if (hiddenCheck) hiddenCheck.prop('checked', true);
      if ($('.prev-image0').length == 0) {
        let html = buildHTML0(image)
        $('.prev-contents0').prepend(html);
      } else {
        $('.prev-content .prev-image0').attr({ src: image });
      }
    }
  });
  $(document).on("click", '.deletebtn0', function() {
    $('.prev-image0').remove();
    var target_image = $(this).parent().parent()
    target_image.remove();
    $('.js-file0').val("")
  })


  $(document).on("click", '.deletebtn1a', function() {
    $('.prev-image1a').hide();
    var target_image = $(this).parent().parent()
    target_image.hide();
  });
  $(document).on('change', '.js-file1', function() {
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      $('.prev-image1a').hide();
      var target_image = $('.deletebtn1a').parent().parent()
      target_image.hide();
      const targetIndex = $('.hidden-destroy1').data('index')
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy1`);
      if (hiddenCheck) hiddenCheck.prop('checked', true);
      if ($('.prev-image1').length == 0) {
        let html = buildHTML1(image)
        $('.prev-contents1').prepend(html);
      } else {
        $('.prev-content .prev-image1').attr({ src: image });
      }
    }
  });
  $(document).on("click", '.deletebtn1', function(){
    $('.prev-image1').remove();
    var target_image = $(this).parent().parent()
    target_image.remove();
    $('.js-file1').val("")
  })


  $(document).on("click", '.deletebtn2a', function() {
    $('.prev-image2a').hide();
    var target_image = $(this).parent().parent()
    target_image.hide();
  });
  $(document).on('change', '.js-file2', function() {
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      $('.prev-image2a').hide();
      var target_image = $('.deletebtn2a').parent().parent()
      target_image.hide();
      const targetIndex = $('.hidden-destroy2').data('index')
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy2`);
      if (hiddenCheck) hiddenCheck.prop('checked', true);
      if ($('.prev-image2').length == 0) {
        var html = buildHTML2(image)
        $('.prev-contents2').prepend(html);
      } else {
        $('.prev-content .prev-image2').attr({ src: image });
      }
    }
  });
  $(document).on("click", '.deletebtn2', function() {
    var target_image = $(this).parent().parent()
    target_image.remove();
    $('.js-file2').val("")
  })

});
