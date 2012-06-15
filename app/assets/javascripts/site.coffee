Meejian.signup = ->
  $("#signup form").bind 'ajax:success', (e, data, status, xhr) =>
    $("#signup").html(data)
  $('input[placeholder]').placeholder();
