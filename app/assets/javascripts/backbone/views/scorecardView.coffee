Scorecard.Views.ScorecardView = Backbone.View.extend
  events:
    'click a.edit-spreads': 'editSpreads'
    'click .spreads a.done': 'doneEditSpreads'
    'click .spreads .editable': 'editSpreads'

  initialize: ->
    @id = @options.id

  editSpreads: (e) ->
    e.preventDefault()
    return unless Scorecard.currentAnimal.get('editable')

    @$('a.done').removeClass('hide')
    @$('.spreads').addClass('active')

    $editableFields = @$('.measurement.editable')
    $editableFields.each (i, el) ->
      $field = $(el)
      return if $field.data('editable')
      $field.data('editable', true)
      fraction = Scorecard.currentAnimal.get("#{$field.data('field')}_fraction")
      form = Scorecard.Templates.EditMeasurement.template
        wholeNum: Scorecard.currentAnimal.get("#{$field.data('field')}_whole")
      $field.html(form)
      $field.find('select').val(fraction)

  doneEditSpreads: (e) ->
    e.preventDefault()

    @$('a.done').addClass('hide')
    @$('.spreads').removeClass('active')

    $editableFields = @$('.measurement.editable')
    $editableFields.each (i, el) ->
      $field = $(el)
      $field.data('editable', false)
      wholeNum = $field.find('input.whole-number').val()
      fraction = $field.find('select.fraction').val()
      html = Scorecard.Templates.Measurement.template
        wholeNum: wholeNum
        fraction: fraction
      $field.html(html)
      Scorecard.currentAnimal.set("#{$field.data('field')}_whole", wholeNum)
      Scorecard.currentAnimal.set("#{$field.data('field')}_fraction", fraction)

    Scorecard.currentAnimal.save()
