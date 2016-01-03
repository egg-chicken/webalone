class Alone.LandView
  WIDTH = Alone.CELL_WIDTH
  PATH = "#955257"
  EXIT = "#EEEEFF"
  constructor: (@land)->
    @container = new createjs.Container()
    @path = new createjs.Shape()
    @wall = new createjs.Shape()
    @container.addChild(@wall)
    @container.addChild(@path)

  render: ->
    unless @rendered
      @rendered = true
      @_renderPath()
      @_renderWall()

  _renderPath: ->
    for p in @land.table.pairs()
      unless @land.isWall(p)
        color = if @land.isExit(p) then EXIT else PATH
        @path.graphics
          .beginFill(color)
          .drawRect(p.x * WIDTH, p.y * WIDTH, WIDTH, WIDTH)

  _renderWall: ->
    image = document.getElementById("wall")
    for p in @land.table.pairs()
      if @land.isWall(p)
        @wall.graphics
          .beginBitmapFill(image)
          .drawRect(p.x * WIDTH, p.y * WIDTH, WIDTH, WIDTH)

  getContainer: ->
    @container
