class Alone.MainController
  constructor: (@model, @view)->

  control: ->
    $(document).keydown (e)=>
      code = e.keyCode
      switch(code)
        when 13 then console.log("enter")
        when 32 then console.log("space")
        when 37 then @onPressMoveButton('left')
        when 38 then @onPressMoveButton('up')
        when 39 then @onPressMoveButton('right')
        when 40 then @onPressMoveButton('down')

  onPressMoveButton: (direction)->
    command = new Alone.Command.MoveOrAttack(@_hero(), direction)
    @_playRound(command)

  onCompleteBoard: ->
    @model.setup()
    @view.cleanup()
    @view.bind(@model.board)

  onFailedBoard: ->
    @view.gameOver()

  _playRound: (command)->
    @model.getPlayer().setCommand(command)
    @model.round(command)
    @view.render()
    if @model.isCompleted()
      @onCompleteBoard()
    else if @model.isFailed()
      @onFailedBoard()

  _hero: ->
    @model.getPlayer().getHero()
