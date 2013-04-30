Scorecard.Templates.EditMeasurement =
  html: """
      <input class="whole-number" type="text" value="{{wholeNum}}">
      <select class="measurement-edit fraction">
        <option value="0">0/8</option>
        <option value="1">1/8</option>
        <option value="2">2/8</option>
        <option value="3">3/8</option>
        <option value="4">4/8</option>
        <option value="5">5/8</option>
        <option value="6">6/8</option>
        <option value="7">7/8</option>
      </select>
      in
    """

  template: (data) ->
    _.template(@html, data)
