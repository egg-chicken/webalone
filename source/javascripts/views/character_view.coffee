class Alone.CharacterView
  WIDTH = 8
  constructor: (@character)->
    @shape = new createjs.Shape()

  render: ->
    @shape.graphics.clear()
    p = @character.getPosition()
    @shape.graphics
      .beginFill("#AAFFAA")
      .drawRect(p.x * WIDTH, p.y * WIDTH, WIDTH, WIDTH)

  getContainer: ->
    @shape
