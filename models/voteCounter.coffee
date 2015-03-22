class @VoteCounter
  'use strict'

  constructor: () ->
    @tally =
      'up'    : 0,
      'down'  : 0,
      'left'  : 0,
      'right' : 0

  increment: (direction) ->
    @tally[direction]++

  reset: () ->
    @tally[vote] = 0 for vote, count of @tally

  mostVotes: () ->
    voteCount = _.max(@tally)
    mostVotes = (vote for vote, count of @tally when count is voteCount)
    if mostVotes.length is 1 then mostVotes.pop() else mostVotes