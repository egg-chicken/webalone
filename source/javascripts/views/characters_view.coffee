#= require ./character_view

class Alone.CharactersView
  WIDTH = 8
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

Alone.Logger.isDamaged = (character, point)->
  character.view.blink()
