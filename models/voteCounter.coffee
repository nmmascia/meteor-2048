class @VoteCounter
  'use strict'

  constructor: () ->
    @tally = { 'up': 0, 'down': 0, 'left': 0, 'right': 0 }

  increment: (direction) ->
    @tally[direction]++

  reset: () ->
    for vote, count of @tally
      @tally[vote] = 0
