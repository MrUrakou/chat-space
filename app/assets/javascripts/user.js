$(function(){

var search_list = $("#user-search-results");

function appendUser(user){
    var html = `<div class="chat-group-user clearfix">
                 <p class="chat-group-user__name">
                 ${user.name}
                 </p>
                 <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                </div>`
    search_list.append(html);
  }
  $(function() {
    $(".chat-group-form__input").on("keyup", function() {
      var input = $(".chat-group-form__input").val();
      $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: input },
        dataType: 'json'
      })
     .done(function(users) {
     $("#user-search-results").empty();
       users.forEach(function(user){
        appendUser(user);
       });
     })
    .fail(function(){
      alert('ユーザー検索に失敗しました');
      });
    });
  });
});
