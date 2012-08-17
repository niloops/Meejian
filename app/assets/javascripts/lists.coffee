Meejian.lists = {}

Meejian.lists.show = ->
  $container = $('#lists')
  $header = $container.find '> header'
  $list = $container.find '> section'
  $aside = $container.find '> aside'  
  $products = $list.find '> article'

  #add divider
  $divider = do ->
    $('<div>&nbsp;</div>')
      .addClass('divider')
      .insertBefore($products)

  #set list and container width
  $list.width ($products.outerWidth() + 
    $divider.outerWidth()) * $products.length +
    $aside.outerWidth()
  $container.width $header.outerWidth() +
    $list.outerWidth() +
    $aside.outerWidth()

  #setting divider height, must be called after setting width
  $divider.height $(document).height()

  #setting header height
  $header.height $(document).height()

  #hide all lists
  marginLeft = -$('#lists-all').outerWidth()
  $('#lists-all').css('margin-left', marginLeft).css('z-index', -100)

  #add event to all lists
  $('#lists-link').click ->
    $('#lists-all').css('marginLeft', 0)
    $(this).addClass('active')
    $('.collapse').fadeIn(600)

  $('.collapse').click ->
    $('#lists-all').css('marginLeft', marginLeft)
    $('#lists-link').removeClass('active')
    $(this).fadeOut(600)

  
  #show all lists from beginning
  #$('#lists-link').trigger('click')

