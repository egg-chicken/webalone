#= require corealone.min
#= require views/board_view
#= require controllers/main_controller

onLoad = =>
  dealer = new Alone.Dealer()
  boardView = new Alone.BoardView(dealer.board)
  controller = new Alone.MainController(dealer, boardView)
  controller.control()

  stage = new createjs.Stage("screen")
  stage.addChild(boardView.getContainer())

  tick = -> stage.update()
  createjs.Ticker.framerate = 60
  createjs.Ticker.addEventListener("tick", tick)

document.addEventListener("DOMContentLoaded", onLoad)
