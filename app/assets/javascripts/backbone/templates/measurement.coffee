Scorecard.Templates.Measurement =
  html: """
    <div class="measurement">
      <div class="whole_num">{{wholeNum}}</div>
      <div class="fraction">
        <div class="fraction_variable">{{fraction}}</div>
        <div class="fraction_constant fine_print">
          8
        </div>
      </div>
      <div class="fine_print">in</div>
    </div>
    """

  template: (data) ->
    _.template(@html, data)
