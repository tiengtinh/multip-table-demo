isFunction = (functionToCheck) ->
  getType = {}
  functionToCheck and getType.toString.call(functionToCheck) is "[object Function]"
$$.isFunction = Quo.isFunction || isFunction

$$.events = 
  transitionEndEvent: ->
    t = undefined
    el = document.createElement("div")
    transitions =
      transition: "transitionend"
      OTransition: "oTransitionEnd"
      MozTransition: "transitionend"
      WebkitTransition: "webkitTransitionEnd"
      MSTransitionEnd: "MSTransitionEnd"

    for t of transitions
      return transitions[t]  if el.style[t] isnt `undefined`

  animationEndEvent: ->
    t = undefined
    el = document.createElement("div")
    animations =
      webkitAnimation: "webkitAnimationEnd"
      animation: "animationend"
      oanimation: "oanimationend"
      animation: "animationend"      
      MSAnimation: "MSAnimationEnd"

    for t of animations
      return animations[t]  if el.style[t] isnt `undefined`


$$.fn.one = (event, callback, context) ->
  
  self = $.observable(context)
  self.one(event, callback)  
  
  @.on event, (e) =>    
    self.trigger(event, e)
    @.off(event)      

