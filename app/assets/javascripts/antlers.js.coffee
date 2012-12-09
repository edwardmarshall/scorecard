# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  # This changes the display into the form
  $('body').on 'click', '.editPoint', (e)->
    e.preventDefault()
    $element = $(e.currentTarget)
    onSuccess = (response)->
      $element.parent().replaceWith(response.html)
    $.ajax
      url: $element.data('point_url')
      type: 'GET'
      success: onSuccess

  # This save the form to the server and shows the display
  $('body').on 'click', 'form.edit_point input[type="submit"]', (e)->
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
