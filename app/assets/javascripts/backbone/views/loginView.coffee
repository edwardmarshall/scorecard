Scorecard.Views.LoginView = Backbone.View.extend
  events:
    'click a.sign-up': 'signUpClicked'
    'click a.sign-in': 'signInClicked'

  signUpClicked: (e) ->
    console.log 'sign up clicked'
    e.preventDefault()
    @$('form.sign-in').slideUp()
    @$('form.sign-up').slideDown()

  signInClicked: (e) ->
    console.log 'sign in clicked'
    e.preventDefault()
    @$('form.sign-in').slideDown()
    @$('form.sign-up').slideUp()
