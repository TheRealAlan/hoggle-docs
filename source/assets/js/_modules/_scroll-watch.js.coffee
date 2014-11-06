class window.ScrollWatch

  @init: ->
    @_observers = []
    @last_scroll_y = @_current_scroll_y()

    window.addEventListener 'scroll', @on_scroll, false

  @_current_scroll_y: ->
    window.scrollY || document.documentElement.scrollTop

  @register_observer: (observer) ->
    @_observers.push observer

  @call_observers: ->
    for observer in @_observers
      observer.scroll_update @last_scroll_y

  @request_tick: ->
    if not @ticking
      requestAnimationFrame @update
      @ticking = true

  @on_scroll: ->
    ScrollWatch.last_scroll_y = ScrollWatch._current_scroll_y()
    ScrollWatch.request_tick()

  @update: ->
    ScrollWatch.call_observers()
    ScrollWatch.ticking = false

ScrollWatch.init()


$ ->

  # Init Header
  scroll_watch = new window.ScrollWatch