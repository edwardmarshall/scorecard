Scorecard.Routers.Router = Backbone.Router.extend
  routes:
    "scorecards/new": "newScorecardView"   # search/kiwis/p7
    "scorecards/:id": "scorecardView"   # search/kiwis/p7

  newScorecardView: ->
    Scorecard.currentAnimal = new Scorecard.Models.Animal()

  scorecardView: (id) ->
    Scorecard.currentAnimal = new Scorecard.Models.Animal(id: id)
    Scorecard.currentAnimal.fetch()
    new Scorecard.Views.ScorecardView
      el: $('.main.container')
      id: id
    console.log "edit scorecard view#{id}"
