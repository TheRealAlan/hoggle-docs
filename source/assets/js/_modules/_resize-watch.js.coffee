class window.ResizeWatch

  @setup: ->
    @_observers = []

    window.addEventListener "resize", @on_resize, false
    @step()

  @register_observer: (observer) ->
    @_observers.push observer

  @call_observers: () ->
    for observer in @_observers
      observer.resize_update()

  @step: ->
    clearTimeout @timeout
    @timeout = setTimeout @_on_resize, 300

  @on_resize: ->
    ResizeWatch.step()

  @_on_resize: ->
    ResizeWatch.call_observers()

ResizeWatch.setup()