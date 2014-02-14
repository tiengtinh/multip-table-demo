require.config
  #urlArgs: "bust=" + (new Date()).getTime() #for dev
  baseUrl: "components"
  paths:        
    quojs: "quojs/quo.debug"
    riotjs: "riotjs/riot"
    cordova: "../cordova"
    app: "../js"        

  shim:
    quojs:      
      exports: '$$'
    riotjs:
      exports: '$'    

  deps: ["require"]      

require(['quojs', 'riotjs', 'app/exts/quo-ext', 'app/app'], ($$, $, quoExt, app) ->    
    console.log 'init'
    app({
      page: location.hash.slice(2),
      root: $$("body"),
      debug: true,
      cache: false
    })  
  
  
  #app.initialize()
)