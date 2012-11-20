Meejian.Interview =
  edit: ->
    $('.wysihtml5').each (i, e) ->
      $(e).wysihtml5
        "font-styles": false,
        locale: "zh-CN"

    $('form.edit_interview').sisyphus
      timeout: 5
  # editor = $(this).next().find('textarea').data("wysihtml5").editor
  # editor.focus()
  # editor.composer.commands.exec("createLink", {href: "http://google.com", text: "google"})

    $('#new_product_modal').on 'shown', ->
      $('form.edit_product').on 'ajax:success', (e, html) ->
        $(this).replaceWith(html)

    $('.product_control:first').click()

    
