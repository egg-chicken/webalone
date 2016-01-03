class Alone.ItemView
  WIDTH = Alone.CELL_WIDTH
  COLOR = "#AAAAFF"
  constructor: (@item)->
    @shape = new createjs.Shape()
    @shape.graphics.beginFill(COLOR).drawRect(0, 0, WIDTH, WIDTH)
    @shape.x = @_position().x
    @shape.y = @_position().y

  render: ->
    @shape.x = @_position().x
    @shape.y = @_position().y

  _position: ->
    p = @item.getPosition()
    { x: p.x * WIDTH, y: p.y * WIDTH }

  getContainer: ->
    @shape
