Scorecard.Views.LoginView = Backbone.View.extend
  events:
    'click a.sign-up': 'signUpClicked'
    'click a.sign-in': 'signInClicked'

  signUpClicked: (e) ->
    e.preventDefault()

    @$('h2.title').text('Sign Up')
    @$('form.sign-in').slideUp()
    @$('form.sign-up').slideDown()

  signInClicked: (e) ->
    e.preventDefault()

    @$('h2.title').text('Sign In')
    @$('form.sign-in').slideDown()
    @$('form.sign-up').slideUp()
