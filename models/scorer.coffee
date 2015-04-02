class @Scorer
  'use strict'

  constructor: (@currentScore) ->
    @currentScore ?= 0

  increment: (points) ->
    @currentScore += points