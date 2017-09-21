$(function(){
  function buildHTML(message){

  if (message.image == null){
    image_html = ``
  } else {
    image_html = `<div class = "message-bottom"><img src ="${message.image}" width="120" height="180"}</div>`
  }

    var html = `<div class="message-top">
                  <div class="message-top__name">
                    ${message.name}
                  </div>
                  <div class="message-top__date">
                    ${message.created_at}
                  </div>
                  <div class="message-bottom">
                    ${message.text}
                    ${image_html}
                  </div>
                </div>`
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    console.log;
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.contents__messages').append(html)
      $('.contents__form-image').reset();
      $('.contents__form-field').reset();
      $(".button").attr('disabled', false);
      $('.contents__messages').animate({scrollTop: $('.contents__messages')[0].scrollHeight}, 'fast');
    })
    .fail(function(){
      alert('error');
    })
  });
});
