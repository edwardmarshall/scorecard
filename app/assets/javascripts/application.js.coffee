# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require underscore
#= require backbone
#= require_self
#= require_tree ./backbone/templates/
#= require_tree ./backbone/models
#= require_tree ./backbone/views
#= require_tree ./backbone/routers

window.Scorecard =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  Templates: {}
  start: ->
    Scorecard.router = new Scorecard.Routers.Router
    console.log Backbone.history.start(pushState: true)

$ ->
  window.generic_ajax_error_handler = (jqXHR, textStatus, errorThrown)->
    console.log(jqXHR)
    console.log(textStatus)
    console.log(errorThrown)

  $.ajaxSetup
    beforeSend: (xhr)->
      xhr.setRequestHeader("Accept", "application/json")
    error: generic_ajax_error_handler

  _.templateSettings =
    interpolate : /\{\{(.+?)\}\}/g

  window.delay = (timeout, fn) ->
    setTimeout(fn, timeout)

  #delay 1000, Scorecard.start
  Scorecard.start()
