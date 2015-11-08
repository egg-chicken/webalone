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
    @landView.render()

    @itemsView = new Alone.ItemsView(@board.items)
    @itemsView.render()

    @charactersView = new Alone.CharactersView(@board.getCharacters())
    @charactersView.render()

    @container.addChild(@landView.getContainer())
    @container.addChild(@itemsView.getContainer())
    @container.addChild(@charactersView.getContainer())
    createjs.Tween.get(@container).to(alpha: 0).to(alpha: 1, 1000)

  gameOver: ->
    createjs.Tween.get(@container).to(alpha: 0, 1000)
