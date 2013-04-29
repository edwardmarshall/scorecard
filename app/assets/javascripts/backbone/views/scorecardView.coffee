Scorecard.Views.ScorecardView = Backbone.View.extend
  events:
    'click a.edit-spreads': 'editSpreads'
    'click a.edit-spreads-done': 'doneEditSpreads'
    'click ul.editable': 'editSpreads'

  initialize: ->
    @id = @options.id

  editSpreads: (e) ->
    e.preventDefault()
    @$('a.edit-spreads-done').removeClass('hide')

    $editableFields = @$('ul.editable')
    $editableFields.each (i, el) ->
      $field = $(el)
      return if $field.data('editable')
      $field.data('editable', true)
      fraction = Scorecard.currentAnimal.get("#{$field.data('field')}_fraction")
      form = Scorecard.Templates.EditMeasurement.template
        wholeNum: Scorecard.currentAnimal.get("#{$field.data('field')}_whole")
      $field.find('.color1').html(form)
      $field.find('.color1 select').val(fraction)

  doneEditSpreads: (e) ->
    e.preventDefault()
    @$('a.edit-spreads-done').addClass('hide')
    $editableFields = @$('ul.editable')
    $editableFields.each (i, el) ->
      $field = $(el)
      $field.data('editable', false)
      wholeNum = $field.find('input').val()
      fraction = $field.find('select').val()
      html = Scorecard.Templates.Measurement.template
        wholeNum: wholeNum
        fraction: fraction
      $field.find('.color1').html(html)
      Scorecard.currentAnimal.set("#{$field.data('field')}_whole", wholeNum)
      Scorecard.currentAnimal.set("#{$field.data('field')}_fraction", fraction)

    Scorecard.currentAnimal.save()
