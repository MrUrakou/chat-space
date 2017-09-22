$(function() {
  $(".chat-group-form__input").on("keyup", function() {
    var input = $(".chat-group-form__input").val();
    $.ajax({
      type: 'GET',
      url: '/users/index',
      data: { keyword: input },
      dataType: 'json'
    })
  });
});
