Meejian.Home =
  avatar_tip: (avatar_exist) ->
    return if avatar_exist
    $element = $("#current_user_nav")
    $element.popover
      placement: "bottom"
      content: ""
    .popover('show')
