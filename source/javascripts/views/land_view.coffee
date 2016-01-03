class Alone.LandView
  WIDTH = Alone.CELL_WIDTH
  PATH = "#955257"
  EXIT = "#99FF99"
  constructor: (@land)->
    @container = new createjs.Container()
    @path = new createjs.Shape()
    @wall = new createjs.Shape()
    @container.addChild(@path)
    @container.addChild(@wall)

  render: ->
    unless @rendered
      @rendered = true
      @_renderPath()
      @_renderExit()
      @_renderWall()

  _renderExit: ->
    image = document.getElementById("exit")
    for p in @land.table.pairs()
      if @land.isExit(p)
        @path.graphics
          .beginBitmapFill(image)
          .drawRect(p.x * WIDTH, p.y * WIDTH, WIDTH, WIDTH)

  _renderPath: ->
    @path.graphics
      .beginFill(PATH)
      .drawRect(0, 0, @land.table.width * WIDTH, @land.table.height * WIDTH)

  _renderWall: ->
    image = document.getElementById("wall")
    for p in @land.table.pairs()
      if @land.isWall(p)
        @wall.graphics
          .beginBitmapFill(image)
          .drawRect(p.x * WIDTH, p.y * WIDTH, WIDTH, WIDTH)

  getContainer: ->
    @container
