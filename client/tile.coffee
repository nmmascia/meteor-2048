class @Tile
  constructor: (@value) ->
    @value ?= 0

  isActive: () ->
    @value > 0

  increment: () ->
    @value = @value * 2

  decrement: () ->
    @value = 0

  toString: () ->
    if @isActive() then "#{@value}|" else " |"