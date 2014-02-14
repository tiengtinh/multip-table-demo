#  Handle view switching, aka. "routing"
#  The transition effect is done with CSS#
app (app) ->

  is_active = "is-active"
  
  # 1. select elements from the page to call $.route(path)
  app.root.on "touch", "[href^='#/']", (e) ->
    e.preventDefault()
    link = $$(this)
    
    # no action
    return  if link.hasClass(is_active)
    
    # loading indicator
    link.addClass "is-loading"
    
    # Riot changes the URL, notifies listeners and takes care of the back button
    $.route link.attr("href")
  
  # 2. listen to route clicks and back button
  $.route (path) ->      
    # Call API method to load stuff from server
    app.load path.slice(2)

  
  # 3. Set "is-active" class name for the active page and navi element
  
  # remove existing class
  previousController = null
  pages =
    index: $$("#index-page")
    detail: $$("#detail-page")
  app.on("before:load", ->
    $$("." + is_active).removeClass is_active
  ).on("load", (view) ->    
    # set a new class
    $$("#" + view.controller + "-page").addClass is_active
    
    # remove loading indicator
    #$$("nav .is-loading").removeClass "is-loading"
  ).on("after:loadf", (view) ->    
    console.log 'after:load'
    #page = $$("#" + view.controller + "-page")
    if previousController == 'index'
      pages.index.addClass('page-out')            
      pages.index.one(
        'webkitAnimationEnd'
        (e) =>        
          console.log 'transition end'            
          pages.index.removeClass(is_active)
          #pages.index.removeClass('page-out')
          pages.detail.addClass(is_active).addClass('page-in')
        
        @
      )
      
    else if previousController == 'detail'
      pages.detail.addClass('page-out')            
      pages.detail.one(
        'webkitAnimationEnd'
        (e) ->        
          console.log 'transition end'            
          #pages.detail.removeClass('page-out')
          pages.detail.removeClass(is_active)
          pages.index.addClass(is_active).addClass('page-int')
        
        @
      )
    else
      pages[view.controller].addClass(is_active)

    previousController = view.controller    
  )
  #with async load, DOMContentLoaded fired too early. this is a hack for the app to trigger the current page at load
  #$.route(location.hash)
