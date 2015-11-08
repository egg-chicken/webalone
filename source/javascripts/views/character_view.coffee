class Alone.CharacterView
  WIDTH = 8
  HERO = "#AAFFAA"
  MONSTER = "#FFAAAA"
  constructor: (@character)->
    @shape = new createjs.Shape()
    @color = if @character.isHero() then HERO else MONSTER

  render: ->
    @shape.graphics.clear()
    p = @character.getPosition()
    @shape.graphics
      .beginFill(@color)
      .drawRect(p.x * WIDTH, p.y * WIDTH, WIDTH, WIDTH)

  getContainer: ->
    @shape
