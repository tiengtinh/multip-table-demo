app (app) ->   
  $el = $$('#index-page')

  loaded = false   

  app.on('load:index', (view) ->    

    unless loaded      

      $holder = $$('<div/>')

      CellsFactory.create(db.multipTableData).forEach( (cellModel) ->        
        $holder.append( new CellView(cellModel).render().$el )
      )

      $el.empty().append($holder)
      
      loaded = true    

    app.trigger('after:load', view)

  )
