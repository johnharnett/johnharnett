class Coffee.AppHelper
  constructor: () ->
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
          # fade in team page
          $('#team-page').css(display: "block")
          $('#team-page').transition(opacity: 1, duration: 500)

          # fade out main
          $('#main-page').transition(
            opacity: 0
            duration: 500
            complete: ->
              $('#main-page').css(display: "none")

              history.pushState
                plate_id: 2
                plate: "team"
              , null, "/page/team.html"
          )
      )


