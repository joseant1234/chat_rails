jQuery(document).on 'turbolinks:load', ->
	$('.modal').modal({})
	$(document).on 'keyup','input.autocomplete', (event)->
		$.ajax
			url: '/members/autocomplete_user_email'
			type: 'GET'
			data:
				term: $(this).val()
			success: (response)->
				userArrays = response
				userList = {}
				i = 0
				while i < userArrays.length
					userList["name"] = userArrays[i]
					i++
				console.log userList
				$('input.autocomplete').autocomplete
					data: userList
					onAutocomplete: (data)->
						console.log data
	# $("input.autocomplete").autocomplete
	# 	source: (term,response)->
	# 		$.getJSON '/members/autocomplete_user_email', { q: term }, (data)-> response(data)
	# 	renderItem: (item,search)->
	# 		search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&')
	# 		re = new RegExp('(' + search.split(' ').join('|') + ')', 'gi')
	# 		'<div class="autocomplete-suggestion" data-id="' + item[0] + '" data-val="' + item[1] + '">' + item[1].replace(re, '<b>$1</b>') + '</div>'
	# 	onSelect: (e,term,item)->
	# 		console.log item
	# 	