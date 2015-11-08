#= require ./land_view
#= require ./item_view
#= require ./characters_view

onLoad = =>
  landView = new Alone.LandView(Alone.board.land)
  landView.render()

  itemView = new Alone.ItemView(Alone.board.items.list[0])
  itemView.render()

  charactersView = new Alone.CharactersView(Alone.board.getCharacters())
  charactersView.render()

  root = new createjs.Container()
  root.addChild(landView.getContainer())
  root.addChild(itemView.getContainer())
  root.addChild(charactersView.getContainer())

  stage = new createjs.Stage("screen")
  stage.addChild(root)

  playRound = ->
    Alone.round()
    charactersView.render()

    if Alone.boardIsCompleted()
      Alone.setupBoard()
    else if Alone.boardIsFailed()
      process.exit()

  setInterval(playRound, 1000)

  tick = -> stage.update()
  createjs.Ticker.framerate = 60
  createjs.Ticker.addEventListener("tick", tick)

document.addEventListener("DOMContentLoaded", onLoad)
