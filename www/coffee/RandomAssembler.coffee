class RandomAssembler
  constructor: (@min, @max) ->
    @existeds = []

  getRandomInt: ->
    Math.floor(Math.random() * (@max - @min + 1)) + @min

  randomUniqueB: ->
    b = @getRandomInt(@min, @max)

    if @existeds.length >= @max - @min + 1
      @existeds = []

    if _.exist(@existeds, b )
      @randomUniqueB()
    else
      @existeds.push(b)
      b