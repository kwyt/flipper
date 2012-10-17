(($) ->
  $.fn.extend flipper: (options) ->
    opts =
      animSpeed: 210
      switchImg: ""
      imgWrap: ""
      imgWrapWidth: "px"
      imgWrapHeight: "px"
      on: "0"
      off: "px"

    options = $.extend(opts, options)
    
    @each ->
      opt = options
      $(this).css("display", "none").after "<span class=\"switch\"><img src=\"" + opt.imgWrap + "\" width=\"" + opt.imgWrapWidth + "\" height=\"" + opt.imgWrapHeight + "\" /></span>"
      $(this).next("span.switch").css
        display: "inline-block"
        "background-image": "url(\"" + opt.switchImg + "\")"
        "background-repeat": "no-repeat"
        overflow: "hidden"

      $(this).next("span.switch").on "click", ->
        if $(this).prev().prop("checked")
          $(this).stop().animate
            backgroundPosition: opt.off
          , opt.animSpeed
          $(this).prev().removeAttr "checked"
          val = $(this).prev().prop("checked")
          console.log val
        else
          $(this).stop().animate
            backgroundPosition: opt.on
          , opt.animSpeed
          $(this).prev("input").prop "checked", "checked"
          val = $(this).prev().prop("checked")
          console.log val

      $(this).next("span.switch").css backgroundPosition: (if $(this).prop("checked") then opt.on else opt.off)
      $("input + span").on "click", ->
        false

      $(this).next("span").stop().animate
        backgroundPosition: (if $(this).prop("checked") then opt.on else opt.off)
      , opt.animSpeed

) jQuery