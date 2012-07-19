Meejian.signup = ->
  $("#signup form").bind 'ajax:success', (e, data, status, xhr) =>
    $("#signup").html(data)
  $('input[placeholder]').placeholder()
  $('a.plink').attr('title', "觅见现在开发中，敬请期待")
  $('a.plink').attr('rel', "tooltip")
  $('a.plink').tooltip()
  $('a.outlink').attr('target', '_blank')
