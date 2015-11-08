#= require ./land_view
#= require ./characters_view

onLoad = =>
  landView = new Alone.LandView(Alone.board.land)
  landView.render()

  charactersView = new Alone.CharactersView(Alone.board.getCharacters())
  charactersView.render()

  root = new createjs.Container()
  root.addChild(landView.getContainer())
  root.addChild(charactersView.getContainer())

  stage = new createjs.Stage("screen")
  stage.addChild(root)
  stage.update()

  playRound = ->
    Alone.round()
    charactersView.render()
    stage.update()

    if Alone.boardIsCompleted()
      Alone.setupBoard()
    else if Alone.boardIsFailed()
      process.exit()

  setInterval(playRound, 1000)

document.addEventListener("DOMContentLoaded", onLoad)
