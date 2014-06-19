class Coffee.AppHelper
  constructor: () ->
    @aboutButton = $("#about-button");

    this._setupLogoHover()
    this._setupAboutButton()
    this._setupPushState()

  _setupLogoHover: () =>
    $("#logo-image").hover(
      ->
        $(this).transition(scale: 1.1, duration: 120)
      ->
        $(this).transition(scale: 1, duration: 500)
    )

  _setupAboutButton: () =>
    @aboutButton.click =>
      @aboutButton.transition(scale: 2, duration: 120)
      .transition(
        scale: 1
        duration: 500
        complete: =>
          # fade in team page
          $('#team-page').css(display: "block")
          $('#team-page').transition(opacity: 1, duration: 500)

          # fade out main
          $('#main-page').transition(
            opacity: 0
            duration: 500
            complete: =>
              $('#main-page').css(display: "none")

              this._pushState('team')
          )
      )

  _setupPushState: () =>
    window.onpopstate = (event) ->
      if event.state
        page = event.state.page

        if page == 'main'
          document.location.reload()
        else if page == 'team'
          document.location.reload()
      else
        # main page doesn't have an event.state.page
        document.location.reload()

  _pushState: (page) ->
    path = "/page/#{page}.html"

    console.log(path)

    history.pushState
      page: page
    , null, "/page/#{page}.html"
