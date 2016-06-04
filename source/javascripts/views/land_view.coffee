#= require graphics/rect_graphic

class Alone.LandView
  EXIT = "#99FF99"
  constructor: (@land)->
    @container = new createjs.Container()
    @path = new Alone.RectGraphic("#955257")
    @wall = new Alone.RectGraphic("wall")
    @exit = new Alone.RectGraphic("exit")
    @container.addChild(@path.getShape())
    @container.addChild(@exit.getShape())
    @container.addChild(@wall.getShape())
    @complete = false

  render: ->
    return if @complete
    @path.draw(xSize: @land.table.width, ySize: @land.table.height)
    for p in @land.table.pairs()
      @exit.draw(p) if @land.isExit(p)
      @wall.draw(p) if @land.isWall(p)
    @complete = true

  getContainer: ->
    @container
