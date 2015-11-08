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
    { x: p.x * WIDTH, y: p.y * WIDTH }

  blink: ->
    createjs.Tween.get(@shape)
      .to(visible: false).wait(30).to(visible: true).wait(30)
      .to(visible: false).wait(30).to(visible: true).wait(30)
      .to(visible: false).wait(30).to(visible: true)


  getContainer: ->
    @shape
