Meejian.signup = ->
  $("#signup form").bind 'ajax:success', (e, data, status, xhr) =>
    $("#signup").html(data)
  $('input[placeholder]').placeholder()
  $('a.plink').attr('title', "觅见现在准备中，功能将在近期逐渐开放，敬请期待")
  $('a.outlink').attr('target', '_blank')
