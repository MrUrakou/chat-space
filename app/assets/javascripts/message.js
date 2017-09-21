$(function(){
  function buildHTML(message){

    var html = `<div class="message-top">
                  <div class="message-top__name">
                    ${message.name}
                  </div>
                  <div class="message-top__date">
                    ${message.created_at}
                  </div>
                  <div class="message-bottom">
                    ${message.text}
                    ${message.image}
                  </div>
                </div>`
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
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
      $('.contents__form-field').val('')
      $(".button").attr('disabled', false);
      $('.contents__messages').animate({scrollTop:$('.contents__form').offset().top});
    })
    .fail(function(){
      alert('error');
    })
  });
});
