class CellView

  $el: null

  _tempate = $$('#template-cell').html()  

  constructor: (@model) ->

  render: ->
    @el = $.render(_tempate, @model.attrs)
    @$el = $$(@el)

    #console.log '@$el', @$el

    #console.log '@$el', @$el
    
    $valueResult = @$el.find('.value-result')
    $valueB      = @$el.find('.value-b')
    $titleBox    = @$el.find('.titleBox')

    revealResult = (e) =>      
      e.stopPropagation()
      if @model.attrs.reveal then return

      $titleBox.addClass('reveal-animation')
      console.log '$$.events.transitionEndEvent() ', $$.events.transitionEndEvent() 
      $titleBox.one(
        $$.events.transitionEndEvent() 
        (e) =>          
          $valueResult.html(@model.getResult(true))           
          $titleBox.removeClass('reveal-animation')
          
        @
      )

    rollTheDice = (e) =>      
      e.stopPropagation()
      @$el.addClass('roll-the-dice')
      $valueB.html(@model.resetB().attrs.b)
      $valueResult.html(@model.getResult())
      console.log '$$.events.animationEndEvent()', $$.events.animationEndEvent()
      @$el.one(
        $$.events.animationEndEvent()
        (e) =>                    
          #walk around for bug no animation on removeClass on Android
          @$el.removeClass('roll-the-dice')
        
        @
      )                        

    @$el.on 'hold', revealResult
    @$el.on 'pinch', revealResult
    @$el.on 'swipeLeft', rollTheDice
    @$el.on 'swipeRight', rollTheDice
      

    @$el.on 'click',  (e) =>
      e.preventDefault()
      $.route('#/' + @model.attrs.a)      
      
    @
