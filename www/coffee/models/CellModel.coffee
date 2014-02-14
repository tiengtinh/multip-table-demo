class CellModel  

  _randomB = -> Math.ceil(Math.random() * 10)

  constructor: (@attrs) ->
    @observer = $.observable(@)
    @randomAssembler = new RandomAssembler(2, 10)

    #@attrs.b = @attrs.b || @randomAssembler.randomUniqueB()
    
    @observer.on 'resetB', =>
      @getResult()
      @calculateBoxClass()      

    @resetB()
  
  getResult: (reveal) ->        
    @attrs.reveal = reveal
    @attrs.result = 
      if @attrs.reveal
        @attrs.a * @attrs.b
      else
        '?'    

  resetB: ->    
    @attrs.b = @randomAssembler.randomUniqueB()
    @attrs.reveal = false
    @observer.trigger('resetB')
    @

  calculateBoxClass: -> 
    if @countDigit() > 1 then @attrs.boxClass = 'box-2'
    @observer.trigger('calculateBoxClass')
    @

  countDigit: () -> _.countDigit(@attrs.a)

  generateTable: ->
    table = []
    for b in [1..10]      
      table.push {a: @attrs.a, b: b, result: @attrs.a * b}
    table
