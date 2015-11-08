#= require corealone.min
#= require views/board_view

onLoad = =>
  dealer = new Alone.Dealer()
  boardView = new Alone.BoardView(dealer.board)
  stage = new createjs.Stage("screen")
  stage.addChild(boardView.getContainer())

  tick = -> stage.update()
  createjs.Ticker.framerate = 60
  createjs.Ticker.addEventListener("tick", tick)

  playRound = ->
    return if dealer.boardIsFailed()
    dealer.round()
    dealer.setupBoard() if dealer.boardIsCompleted()
    boardView.render()

  setInterval(playRound, 1000)

document.addEventListener("DOMContentLoaded", onLoad)
