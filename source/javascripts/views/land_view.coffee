class Alone.LandView
  WIDTH = 8
  PATH = "#955257"
  EXIT = "#EEEEFF"
  constructor: (@land)->
    @path = new createjs.Shape()

  render: ->
    @path.graphics.clear()
    for p in @land.table.pairs()
      unless @land.isWall(p)
        color = if @land.isExit(p) then EXIT else PATH
        @path.graphics
          .beginFill(color)
          .drawRect(p.x * WIDTH, p.y * WIDTH, WIDTH, WIDTH)

  getContainer: ->
    @path
