#= require core
#= require config
#= require views/board_view
#= require controllers/main_controller

onLoad = =>
  dungeon = new Alone.Dungeon()
  dungeon.setup()
  boardView = new Alone.BoardView(dungeon.board)
  controller = new Alone.MainController(dungeon, boardView)
  controller.control()

  stage = new createjs.Stage("screen")
  stage.addChild(boardView.getContainer())

  tick = -> stage.update()
  createjs.Ticker.framerate = 60
  createjs.Ticker.addEventListener("tick", tick)

document.addEventListener("DOMContentLoaded", onLoad)
