# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.editPoint').click (e)->
    e.preventDefault()
    $element = $(e.currentTarget)
    onSuccess = (response)->
      $element.replaceWith(response.html)
    $.ajax
      url: $element.data('point_url')
      type: 'GET'
      success: onSuccess
