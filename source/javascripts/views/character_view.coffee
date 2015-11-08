class Alone.CharacterView
  WIDTH = 8
  HERO = "#AAFFAA"
  MONSTER = "#FFAAAA"
  constructor: (@character)->
    @color = if @character.isHero() then HERO else MONSTER
    @shape = new createjs.Shape()
    @shape.graphics.beginFill(@color).drawRect(0, 0, WIDTH, WIDTH)

  render: ->
    p = @character.getPosition()
    @shape.x = p.x * WIDTH
    @shape.y = p.y * WIDTH

  getContainer: ->
    @shape
