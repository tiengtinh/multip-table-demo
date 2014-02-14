app (app) ->   
  $el       = $$('#detail-page')
  _template = $$('#template-single').html()

  app.on('load:detail', (view) ->

    a         = parseInt(view.uri)
    
    cellModel = new CellModel(a: a)
          
    $holder   = $$('<div/>')

    color = db.findColor(a)
    cellModel.generateTable().forEach( (cell) ->
      cell.color = color
      $holder.append $.render(_template, cell)
    )
    
    $el.empty().append($holder)
    
    #manually remove each color class one by one. need to find a better approach
    #db.allColor().forEach (cssClass) -> $el.removeClass(cssClass)    
    #$el.addClass(db.findColor(a))

    app.trigger('after:load', view)   
  )




