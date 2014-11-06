//= require '_modules/_scroll-watch.js.coffee'
//= require '_modules/_resize-watch.js.coffee'
//= require 'velocity/velocity.js'

class NavHighlight

  constructor: () ->
    ScrollWatch.register_observer @
    ResizeWatch.register_observer @

    @$container  = $('html')
    @$body       = $('body')
    @$nav        = $('.main-nav')
    @$nav_mobile = $('.nav-mobile-btn')
    @$nav_link   = $('.main-nav-link')

    @sections = {}
    @scroll_offset = 36

    @_add_events()
    @resize_update()

  scroll_update: (scroll_position) ->

    for section in @sections
      if scroll_position >= section.top
        section.target
          .closest 'li'
          .addClass 'is-here'
          .siblings()
          .removeClass 'is-here'

  resize_update: () ->
    @_calculate_sections()

  _calculate_sections: () ->

    @sections = $('.section').map ( idx, el ) =>
      $section = $(el)
      top = $section.offset().top - @scroll_offset - 2
      target = "##{$section.attr('id')}"
      $target = $(".main-nav-link[href='#{target}']")

      {
        el: $section
        top: top
        idx: idx
        target: $target
      }

  _add_events: () ->

    @$nav_mobile.on 'click', ( ev ) =>
      @$body.toggleClass 'menu-open'

    @$nav_link.on 'click', ( ev ) =>
      ev.preventDefault()
      target = $(ev.target).attr 'href'
      offset = $(target).offset().top - @scroll_offset
      @$body.removeClass 'menu-open'

      @$container.velocity 'scroll', {
        offset: "#{offset}px"
        mobileHA: false
        duration: 500
      }



$ ->

  window.App ?= {}
  window.App.NavHighlight = new NavHighlight()