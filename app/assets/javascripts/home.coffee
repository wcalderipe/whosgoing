$(document).ready ->
  extractEventId = (value) ->
    match = value.match(/events\/(.*)/g)
    value = match[0]
    value = value.replace('events/', '')
    return value.replace('events/', '').replace(/\/(.*)$/g, '')

  $('#main-form').on 'submit', (e) ->
    e.preventDefault()
    value = $('#event').val()
    baseUrl = $('meta[name="base_url"]').attr('content')
    window.location.replace(baseUrl + '/events/' + extractEventId(value))
