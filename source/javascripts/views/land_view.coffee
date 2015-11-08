class Alone.LandView
  WIDTH = 8
  constructor: (@land)->
    @path = new createjs.Shape()

  render: ->
    @path.graphics.clear()
    for p in @land.table.pairs()
      unless @land.isWall(p)
        @path.graphics
          .beginFill("#955257")
          .drawRect(p.x * WIDTH, p.y * WIDTH, WIDTH, WIDTH)

  getContainer: ->
    @path
