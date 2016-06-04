class Alone.RectGraphic
  WIDTH = Alone.CELL_WIDTH

  constructor: (color)->
    @shape = new createjs.Shape()
    @color = color

  draw: (options = {})->
    options.x ||= 0
    options.y ||= 0
    options.xSize ||= 1
    options.ySize ||= 1

    @shape.graphics
      .beginFill(@color)
      .drawRect(options.x, options.y, options.xSize * WIDTH, options.ySize * WIDTH)

  setPosition: (p)->
    @shape.x = p.x * WIDTH
    @shape.y = p.y * WIDTH

  getShape: ->
    @shape
