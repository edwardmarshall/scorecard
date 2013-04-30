Scorecard.Routers.Router = Backbone.Router.extend
  routes:
    "scorecards/new": "newScorecardView"
    "scorecards/:id": "scorecardView"
    "(/login)": "login"

  login: ->
    new Scorecard.Views.LoginView
      el: $('.main.container')

  newScorecardView: ->
    Scorecard.currentAnimal = new Scorecard.Models.Animal()

  scorecardView: (id) ->
    Scorecard.currentAnimal = new Scorecard.Models.Animal(id: id)
    Scorecard.currentAnimal.fetch
      success: ->
        Scorecard.leftAntler = new Scorecard.Models.Antler(id: Scorecard.currentAnimal.get('left_antler_id'))
        Scorecard.leftAntler.fetch()

        Scorecard.rightAntler = new Scorecard.Models.Antler(id: Scorecard.currentAnimal.get('right_antler_id'))
        Scorecard.rightAntler.fetch()

    new Scorecard.Views.ScorecardView
      el: $('.main.container')
      id: id
    console.log "edit scorecard view#{id}"
