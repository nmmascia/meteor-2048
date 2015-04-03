Template.grid.helpers
  game: () ->
    Games.find({ current: true })