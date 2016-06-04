class Alone.RectGraphic
  WIDTH = Alone.CELL_WIDTH

  constructor: (imageElementIdOrColor)->
    @shape = new createjs.Shape()
    @image = document.getElementById(imageElementIdOrColor)
    @color = imageElementIdOrColor

  draw: (options = {})->
    @_fill().drawRect(
      (options.x     || 0) * WIDTH,
      (options.y     || 0) * WIDTH,
      (options.xSize || 1) * WIDTH,
      (options.ySize || 1) * WIDTH
    )

  setPosition: (p)->
    @shape.x = p.x * WIDTH
    @shape.y = p.y * WIDTH

  getShape: ->
    @shape

  _fill: ->
    if @image
      @shape.graphics.beginBitmapFill(@image)
    else
      @shape.graphics.beginFill(@color)
