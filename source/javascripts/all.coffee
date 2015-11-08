#= require corealone.min
#= require views/board_view

onLoad = =>
  boardView = new Alone.BoardView(Alone.board)
  stage = new createjs.Stage("screen")
  stage.addChild(boardView.getContainer())

  tick = -> stage.update()
  createjs.Ticker.framerate = 60
  createjs.Ticker.addEventListener("tick", tick)

  playRound = ->
    return if Alone.boardIsFailed()
    Alone.round()
    Alone.setupBoard() if Alone.boardIsCompleted()
    boardView.render()

  setInterval(playRound, 1000)

document.addEventListener("DOMContentLoaded", onLoad)
