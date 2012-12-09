# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  # This changes the display into the form
  $('.pointList').on 'click', '.editPoint', (e)->
    e.preventDefault()
    $element = $(e.currentTarget)
    onSuccess = (response)->
      $element.parent().replaceWith(response.html)
    $.ajax
      url: $element.data('edit_point_url')
      type: 'GET'
      success: onSuccess

  # This save the form to the server and shows the display
  $('.pointList').on 'click', 'form.edit_point input[type="submit"]', (e)->
    e.preventDefault()
    $form = $(e.currentTarget.form)
    data = $form.serialize()
    onSuccess = (response)->
      $form.replaceWith(response.html)
    $.ajax
      url: $form.attr('action')
      data: data
      type: 'POST'
      success: onSuccess

  # This deletes the point and removes it from the display
  $('.pointList').on 'click', 'a[data-method="delete"]', (e)->
    e.preventDefault()
    e.stopPropagation()
    $link = $(e.currentTarget)
    onSuccess = ->
      $link.parents('li').remove()
    $.ajax
      url: $link.attr('href')
      data: $link.data()
      type: 'DELETE'
      success: onSuccess

  # This adds an empty form for new points
  $('.addPoint').on 'click', (e)->
    e.preventDefault()
    e.stopPropagation()
    $link = $(e.currentTarget)
    onSuccess = (response)->
      $li = $('<li>').append(response.html)
      $('.pointList').append($li)
    $.ajax
      url: $link.attr('href')
      data: $link.data()
      type: 'GET'
      success: onSuccess

  # This save a new form to the server and shows the display
  $('.pointList').on 'click', 'form.new_point input[type="submit"]', (e)->
    e.preventDefault()
    $form = $(e.currentTarget.form)
    data = $form.serialize()
    onSuccess = (response)->
      $form.replaceWith(response.html)
    $.ajax
      url: $form.attr('action')
      data: data
      type: 'POST'
      success: onSuccess

      # This shows the point when cancel is clicked
  $('.pointList').on 'click', '.cancelPoint', (e)->
    e.preventDefault()
    $cancelLink = $(e.currentTarget)
    onSuccess = (response)->
      $cancelLink.parents('form').replaceWith(response.html)
    $.ajax
      url: $cancelLink.data('point_url')
      type: 'GET'
      success: onSuccess
