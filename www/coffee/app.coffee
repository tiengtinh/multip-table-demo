# The app API
App = (conf) ->
  self = $.observable(@)  
  $$.extend self, conf    
  
  self.load = (uri) ->
    self.trigger('before:load')
    
    view = uri: uri
    view.controller = 
      if uri == '' then 'index'
      else unless isNaN(uri) then 'detail'
      else 'index'               
    
    self.trigger('load', view)
  
  # on each "page" load
  self.on "load", (view) ->    
    self.trigger "load:" + view.controller, view
    self.page = view.uri
      
  self.trigger("ready")
  self

# The ability to split your single-page application (SPA) into loosely-coupled modules
instance = undefined
app = $.observable((arg) ->
  
  # app() --> return instance
  return instance  unless arg
  
  # app(fn) --> add a new module
  if $$.isFunction(arg)         
    app.on "ready", arg
  
  # app(conf) --> initialize the application
  else
    instance = new App(arg)
    console.log 'initialize the application'     
    
    app.trigger "ready", instance
    #instance.on "ready", ->
      #console.log 'initialize the application >> ready'
    
    
)
