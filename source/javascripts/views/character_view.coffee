class Alone.CharacterView
  WIDTH = Alone.CELL_WIDTH
  SPEED = Alone.ANIMATION_SPEED
  CODE =
   hero:    342
   monster: 339

  constructor: (@character)->
    code = if @character.isHero() then CODE.hero else CODE.monster
    image = document.getElementById("character")
    sheet = @_createSheet(image, code)
    @shape = new createjs.Sprite(sheet, "down")
    @shape.x = @_position().x
    @shape.y = @_position().y

  render: ->
    if @character.isDead()
      return @shape.visible = false
    createjs.Tween.removeTweens(@shape)
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

  _createSheet: (image, code)->
    new createjs.SpriteSheet
      images: [image]
      frames: { width: WIDTH, height: WIDTH }
      animations:
        down:  { frames: [code + 0,  code + 1,  code + 2,  code + 1],  speed: SPEED }
        up:    { frames: [code + 16, code + 17, code + 18, code + 17], speed: SPEED }
        left:  { frames: [code + 32, code + 33, code + 34, code + 33], speed: SPEED }
        right: { frames: [code + 48, code + 49, code + 50, code + 49], speed: SPEED }
