#= require ./item_view

class Alone.ItemsView
  WIDTH = 8
  constructor: (items)->
    @items = items.list
    @container = new createjs.Container()
    @views = []
    for item in @items
      view = new Alone.ItemView(item)
      @container.addChild(view.getContainer())
      @views.push(view)

  render: ->
    for view in @views
      view.render()

  getContainer: ->
    @container
