Scorecard.Views.ScorecardView = Backbone.View.extend
  events:
    'click .spreads .editable': 'editSpreads'
    'click .spreads a.done': 'doneEditSpreads'
    'click .antlers .editable': 'editAntlers'
    'click .antlers a.done': 'doneEditAntlers'

  initialize: ->
    @id = @options.id

  editSpreads: (e) ->
    e.preventDefault()
    return unless Scorecard.currentAnimal.get('editable')

    @$('.spreads a.done').removeClass('hide')
    @$('.spreads').addClass('active')

    $editableFields = @$('.spreads .measurement.editable')
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

    @$('.spreads a.done').addClass('hide')
    @$('.spreads').removeClass('active')

    $editableFields = @$('.spreads .measurement.editable')
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

  editAntlers: (e) ->
    e.preventDefault()
    return unless Scorecard.currentAnimal.get('editable')

    @$('.antlers a.done').removeClass('hide')
    @$('.antlers').addClass('active')

    $editableFields = @$('.antlers .measurement.editable')
    $editableFields.each (i, el) ->
      $field = $(el)
      return if $field.data('editable')
      $field.data('editable', true)
      antler = Scorecard["#{$field.data('side')}Antler"]
      fraction = antler.get("#{$field.data('field')}_fraction")
      form = Scorecard.Templates.EditMeasurement.template
        wholeNum: antler.get("#{$field.data('field')}_whole")
      $field.html(form)
      $field.find('select').val(fraction)

  doneEditAntlers: (e) ->
    e.preventDefault()

    @$('.antlers a.done').addClass('hide')
    @$('.antlers').removeClass('active')

    $editableFields = @$('.antlers .measurement.editable')
    $editableFields.each (i, el) ->
      $field = $(el)
      $field.data('editable', false)
      antler = Scorecard["#{$field.data('side')}Antler"]
      wholeNum = $field.find('input.whole-number').val()
      fraction = $field.find('select.fraction').val()
      html = Scorecard.Templates.Measurement.template
        wholeNum: wholeNum
        fraction: fraction
      $field.html(html)
      antler.set("#{$field.data('field')}_whole", wholeNum)
      antler.set("#{$field.data('field')}_fraction", fraction)

    Scorecard.leftAntler.save()
    Scorecard.rightAntler.save()
