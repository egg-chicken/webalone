class Alone.GridGraphic
  constructor: (imageElementId)->
    @shape = new createjs.Shape()
    @image = document.getElementById(imageElementId)

  draw: (p)->
    w = Alone.CELL_WIDTH
    @shape.graphics
      .beginBitmapFill(@image)
      .drawRect(p.x * w, p.y * w, w, w)

  getShape: ->
    @shape
