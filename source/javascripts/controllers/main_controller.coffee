class Alone.MainController
  constructor: (@dealer, @view)->

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
    command = Alone.Command.createMoveOrAttack(@_hero(), direction)
    @_playRound(command)

  _playRound: (command)->
    return if @dealer.boardIsFailed()
    @dealer.round(command)

    if @dealer.boardIsCompleted()
      @dealer.setupBoard()
      @view.cleanup()
      @view.bind(@dealer.board)
    else if @dealer.boardIsFailed()
      @view.gameOver()

    @view.render()

  _hero: ->
    @dealer.board.getHero()
