class Alone.CharacterView
  WIDTH = 8
  HERO = "#AAFFAA"
  MONSTER = "#FFAAAA"
  constructor: (@character)->
    color = if @character.isHero() then HERO else MONSTER
    @shape = new createjs.Shape()
    @shape.graphics.beginFill(color).drawRect(0, 0, WIDTH, WIDTH)
    @shape.x = @_position().x
    @shape.y = @_position().y

  render: ->
    if @character.isDead()
      @shape.visible = false
    else
      createjs.Tween.get(@shape).to(@_position(), 100)

  _position: ->
    p = @character.getPosition()
    { x: p.x * WIDTH, y: p.y * WIDTH }

  getContainer: ->
    @shape
