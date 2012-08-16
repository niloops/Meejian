Meejian.lists = {}

Meejian.lists.show = ->
  $container = $('#lists')
  $header = $container.find '> header'
  $list = $container.find '> section'
  $products = $list.find '> article'

  #add divider
  $divider = do ->
    $('<div>&nbsp;</div>')
      .addClass('divider')
      .insertBefore($products)

  #set list and container width
  $list.width ($products.outerWidth() + $divider.outerWidth()) * $products.length
  $container.width $header.outerWidth() + $list.outerWidth()

  #setting divider height, must be called after setting width
  $divider.height $(document).height()

