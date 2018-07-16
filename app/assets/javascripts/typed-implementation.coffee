ready = ->
  Typed.new '.element',
      strings: [
        "I've spent the past two years begging other people to do do things that I should be able to do myself",
        "No more begging. I'm tired of it. I want to have this super power. I need to be able to do this myself."
      ]
      typeSpeed: 80
    return


$(document).ready ready
$(document).on 'turbolinks:load', ready
