#= require ./character_view

class Alone.CharactersView
  WIDTH = 8
  constructor: (@characters)->
    @container = new createjs.Container()
    @views = []
    for character in @characters
      view = new Alone.CharacterView(character)
      @container.addChild(view.getContainer())
      @views.push(view)

  render: ->
    for view in @views
      view.render()

  getContainer: ->
    @container
