$ ->
  pageBody = $('#content')
  templates = Handlebars.templates
  
  $.ajaxSetup
    contentType: 'application/json'
    dataType: 'json'
  
  showUsers = ->
    $.ajax '/api/users',
      success: (data) ->
        pageBody.html templates.users(data)
        
  showUser = (id) ->
    $.ajax "/api/users/#{id}",
      success: (data) ->
        pageBody.html templates.user(data)
  
  pageBody.on 'click', '#users-list li', (e) ->
    showUser $(@).data('id')
  
  pageBody.on 'click', '#back-to-users', (e) ->
    showUsers()
  
  # Show the page
  showUsers()