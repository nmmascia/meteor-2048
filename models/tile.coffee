class @Tile
  'use strict'

  constructor: (@value) ->
    @value ?= 0

  isActive: () ->
    @value > 0

  increment: () ->
    @value = @value * 2

  decrement: () ->
    @value = 0

  activate: () ->
    @value = 2

  toString: () ->
    if @isActive() then "#{@value}|" else " |"