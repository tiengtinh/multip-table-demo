class CellView

  $el: null

  _tempate = $$('#template-single').html()  

  constructor: (@model) ->

  render: ->
    @el = $.render(_tempate, @model)
    @$el = $$(@el)