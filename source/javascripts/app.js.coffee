class Coffee.AppHelper
  constructor: () ->
    console.log("running")
    this.mainPage = $("#logo-image")

    this._setupLogoHover()
    this._setupAboutButton()

  _setupLogoHover: () =>
    $("#logo-image").hover(
      ->
        $(this).transition(scale: 1.1, duration: 120)
      ->
        $(this).transition(scale: 1, duration: 500)
    )

  _setupAboutButton: () =>
    $("#about-button").click ->
      $(this).transition(scale: 2, duration: 120)
      .transition(
        scale: 1
        duration: 500
        complete: ->
          $('#team-page').css(display: "block")
          $('#team-page').transition(opacity: 1, duration: 500)
          $('#main-page').transition(
            opacity: 0
            duration: 500
            complete: ->
              $('#main-page').css(display: "none")
          )
      )

