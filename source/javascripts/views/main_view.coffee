#= require ./land_view
#= require ./character_view

onLoad = =>
  landView = new Alone.LandView(Alone.board.land)
  landView.render()

  characterView = new Alone.CharacterView(Alone.board.getHero())
  characterView.render()

  root = new createjs.Container()
  root.addChild(landView.getContainer())
  root.addChild(characterView.getContainer())

  stage = new createjs.Stage("screen")
  stage.addChild(root)
  stage.update()

  playRound = ->
    Alone.round()
    characterView.render()
    stage.update()

    if Alone.boardIsCompleted()
      Alone.setupBoard()
    else if Alone.boardIsFailed()
      process.exit()

  setInterval(playRound, 1000)

document.addEventListener("DOMContentLoaded", onLoad)
