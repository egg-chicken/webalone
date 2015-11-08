#= require ./land_view
#= require ./items_view
#= require ./characters_view


class Alone.BoardView
  constructor: (@board)->
    @landView = new Alone.LandView(@board.land)
    @landView.render()

    @itemsView = new Alone.ItemsView(@board.items)
    @itemsView.render()

    @charactersView = new Alone.CharactersView(@board.getCharacters())
    @charactersView.render()

    @container = new createjs.Container()
    @container.addChild(@landView.getContainer())
    @container.addChild(@itemsView.getContainer())
    @container.addChild(@charactersView.getContainer())

  getContainer: ->
    @container

  render: ->
    @charactersView.render()
    @itemsView.render()
