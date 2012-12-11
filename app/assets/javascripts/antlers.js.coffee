# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#$.ajax({url: "http://localhost:3000/points/770/edit", type: "get", success: function(response){console.log(response)}})

# '$ ->' == '$.onReady ->'

$ -> 
	$('ul.points').on 'click', '.editPoint', (e)->
		e.preventDefault() # This disables the browser link.
		$.ajax
			url: e.currentTarget.href
			type: 'GET'
			success: (response)->
				li = $(e.currentTarget).parent()
				li.empty()
				li.append(response.html)
	
	$('ul.points').on 'click', '.savePoint', (e)->
		e.preventDefault()
		button = e.currentTarget
		$.ajax
			url: button.form.action
			type: 'POST'
			data: $(button.form).serialize() # what I want to post with.
			success: (response)->
				li = $(e.currentTarget).parent().parent().parent()
				li.empty()
				li.append(response.html)
				console.log response

	$('ul.points').on 'click', '.deletePoint', (e)->
		e.preventDefault()
		$.ajax
			url: e.currentTarget.href
			type: 'DELETE'
			success: (response)->
				$(e.currentTarget).parent().remove()