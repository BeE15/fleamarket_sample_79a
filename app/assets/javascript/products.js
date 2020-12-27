$(function() {
  
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

  function buildHTML3(image) {
    var html = `<div class="prev-content">
                  <img src="${image}" alt="preview" class="prev-image3">
                  <div>
                    <a class="deletebtn3">削除<a/>
                  </div>
                </div>`
    return html;
  }

  $(document).on('change', '.js-file1', function() {
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      if ($('.prev-image1').length == 0) {
        let html = buildHTML1(image)
        $('.prev-contents1').prepend(html);
      } else {
        $('.prev-content .prev-image1').attr({ src: image });
      }
    }
  });
  $(document).on("click", '.deletebtn1', function(){
    var target_image = $(this).parent().parent()
    target_image.remove();
    $('.js-file1').val("")
  })
  
  $(document).on('change', '.js-file2', function() {
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      if ($('.prev-image2').length == 0) {
        var html = buildHTML2(image)
        $('.prev-contents2').prepend(html);
      } else {
        $('.prev-content .prev-image2').attr({ src: image });
      }
    }
  });
  $(document).on("click", '.deletebtn2', function(){
    var target_image = $(this).parent().parent()
    target_image.remove();
    $('.js-file2').val("")
  })

  $(document).on('change', '.js-file3', function() {
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      if ($('.prev-image3').length == 0) {
        let html = buildHTML3(image)
        $('.prev-contents3').prepend(html);
      } else {
        $('.prev-content .prev-image3').attr({ src: image });
      }
    }
  });
  $(document).on("click", '.deletebtn3', function(){
    var target_image = $(this).parent().parent()
    target_image.remove();
    $('.js-file3').val("")
  })

});
