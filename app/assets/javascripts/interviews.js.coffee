Meejian.Interviews =
  edit: ->
    $('.wysihtml5').each (i, e) ->
      $(e).wysihtml5
        "font-styles": false,
        "image": false,
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
        Meejian.Interviews.product_form_remote()

      $(target).on 'hide', ->
        $modal_body.empty()
        $(this).off 'click'

      $(target).on 'click', '.close', ->
        $(target).modal('hide')

      editor = $(this).next().find('textarea').data("wysihtml5").editor
      action_target = $(this).attr('data-action')
      $(target).on 'click', action_target, (e) ->
        e.preventDefault()
        editor.focus()
        editor.composer.commands.exec "insertHTML",
          "<a href=\"#{$(this).attr('href')}\" target=\"_blank\"
          title=\"#{$(this).attr('title')}\">#{$(this).attr('title')}</a>"
        $(target).modal('hide')

  product_form_remote: ->
    $("form#new_product").fileupload
      fileInput: null
    .on "fileuploadadd", (e, data) ->
      data.context = $('<div class="progress progress-striped active">
        <div class="bar" style="width: 0%;"></div>
        </div>')
      $("#new_product").append(data.context)
      $("form#new_product input[type='submit']").attr('disabled', true)
    .on "fileuploadprogress", (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
    .on "fileuploaddone", (e, data) ->
      $product_info = $(data.result).find('#product_info')
      if $product_info.length > 0
        $(this).replaceWith $product_info
      else
        $(this).replaceWith $(data.result).find('form#new_product')
        Meejian.Interviews.product_form_remote()
    .submit (e) ->
      e.preventDefault()
      $(this).fileupload 'add',
        fileInput: $("#product_photo")
        dataType: "html"
