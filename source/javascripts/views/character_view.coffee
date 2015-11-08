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
      return @shape.visible = false

    createjs.Tween.get(@shape).to(@_position(), 100)

  _position: ->
    p = @character.getPosition()
    p.times(WIDTH)

  blink: ->
    createjs.Tween.get(@shape)
      .to(visible: false).wait(30).to(visible: true).wait(30)
      .to(visible: false).wait(30).to(visible: true).wait(30)
      .to(visible: false).wait(30).to(visible: true)

  attack: (target)->
    direction = @character.getPosition().where(target.getPosition())
    current = @_position()
    next = current[direction](WIDTH/2)
    createjs.Tween.get(@shape).to(next, 50).to(current, 50)

  getContainer: ->
    @shape
