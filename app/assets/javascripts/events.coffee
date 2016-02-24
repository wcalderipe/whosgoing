$(document).ready ->
  String.prototype.removeAccents = ->
    return this.replace(/[áàãâä]/gi,"a")
      .replace(/[éè¨ê]/gi,"e")
      .replace(/[íìïî]/gi,"i")
      .replace(/[óòöôõ]/gi,"o")
      .replace(/[úùüû]/gi, "u")
      .replace(/[ç]/gi, "c")
      .replace(/[ñ]/gi, "n")
      .replace(/[^a-zA-Z0-9]/g," ")

  filter = (input) ->
    keyword = $(input).val().removeAccents()
    $('#attending li, #interested li, #declined li').each ->
      if $(this).attr('data-person-name').removeAccents().search(keyword) > -1
        $(this).show()
      else
        $(this).hide()

  $('#filter').on 'keyup', (e) ->
    filter(this)
