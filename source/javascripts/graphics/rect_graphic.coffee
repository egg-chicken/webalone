class Alone.RectGraphic
  constructor: (color)->
    @shape = new createjs.Shape()
    @color = color

  draw: (countX, countY)->
    w = Alone.CELL_WIDTH
    @shape.graphics
      .beginFill(@color)
      .drawRect(0, 0, countX * w, countY * w)

  getShape: ->
    @shape
