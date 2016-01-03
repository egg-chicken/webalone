#= require ./land_view
#= require ./items_view
#= require ./characters_view

class Alone.BoardView
  constructor: (@board)->
    @container = new createjs.Container()
    @bind(@board)

  getContainer: ->
    @container

  render: ->
    @_camera()
    @landView.render()
    @charactersView.render()
    @itemsView.render()

  cleanup: ->
    @landView = null
    @itemsView = null
    @charactersView = null
    @container.removeAllChildren()

  bind: (board)->
    @board = board
    @landView = new Alone.LandView(@board.land)
    @itemsView = new Alone.ItemsView(@board.items)
    @charactersView = new Alone.CharactersView(@board.getCharacters())
    @container.addChild(@landView.getContainer())
    @container.addChild(@itemsView.getContainer())
    @container.addChild(@charactersView.getContainer())

  gameOver: ->
    createjs.Tween.get(@container).to(alpha: 0, 1000)

  _camera: ->
    return unless @board.getHero()?
    hero = @board.getHero().getPosition()
    nextPosition =
      x: Alone.STAGE_WIDTH / 2  - hero.x * Alone.CELL_WIDTH
      y: Alone.STAGE_HEIGHT / 2 - hero.y * Alone.CELL_WIDTH
    createjs.Tween.removeTweens(@container)
    createjs.Tween.get(@container).to(nextPosition, 100)
