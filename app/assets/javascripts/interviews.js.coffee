Meejian.Interviews =
  edit: ->
    $('.wysihtml5').each (i, e) ->
      $(e).wysihtml5
        "font-styles": false,
        locale: "zh-CN"

    $('form.edit_interview').sisyphus
      timeout: 5

    $(".product_control").click (e) ->
      e.preventDefault()
      
      target = $(this).attr('data-target')
      href = $(this).attr('href')

      $modal_body = $(target).find('.modal-body')
      $modal_body.load href, ->
        $(target).modal()
        Meejian.Interviews.product_new()

      $(target).on 'hide', ->
        $modal_body.empty()

      editor = $(this).next().find('textarea').data("wysihtml5").editor
      action_target = $(this).attr('data-action')
      $(target).on 'click', action_target, (e) ->
        e.preventDefault()
        editor.focus()
        editor.composer.commands.exec "createLink",
          href: $(this).attr('href')
          text: $(this).attr('title')
        $(target).modal('hide')

  product_new: ->
    $("form#new_product").fileupload(
      fileInput: null
    ).on("fileuploaddone", (e, data) ->
      $(this).replaceWith $(data.result).find('#product_info')
    ).submit (e) ->
      e.preventDefault()
      $(this).fileupload 'add',
        fileInput: $("#product_photo")
        dataType: "html"
