ready = ->
  Typed.new '.element',
      strings: [
        "I've spent the past two years begging other people to do things that I should be able to do myself. ^1000",
        "No more begging. I'm tired of it. I want to have this super power. I need to be able to do this myself. ^1000"
      ]
      typeSpeed: 60
      loop: true
    return


$(document).ready ready
$(document).on 'turbolinks:load', ready
