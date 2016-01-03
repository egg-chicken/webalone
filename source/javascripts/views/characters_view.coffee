#= require ./character_view

class Alone.CharactersView
  WIDTH = Alone.CELL_WIDTH
  constructor: (@characters)->
    @container = new createjs.Container()
    @views = []
    for character in @characters
      character.view = new Alone.CharacterView(character)
      @container.addChild(character.view.getContainer())
      @views.push(character.view)

  render: ->
    for view in @views
      view.render()

  getContainer: ->
    @container
