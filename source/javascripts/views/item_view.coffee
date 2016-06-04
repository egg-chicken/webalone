#= require graphics/rect_graphic

class Alone.ItemView
  COLOR = "#AAAAFF"

  constructor: (@item)->
    @graphic = new Alone.RectGraphic(COLOR)

  render: ->
    @graphic.setPosition(@item.getPosition())
    @graphic.draw()

  getContainer: ->
    @graphic.getShape()
