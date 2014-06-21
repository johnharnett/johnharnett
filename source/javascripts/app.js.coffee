class Coffee.AppHelper
  constructor: () ->
    @aboutButton = $("#about-button");

    this._setupLogoHover()

  _setupLogoHover: () =>
    $("#logo-image").hover(
      ->
        $(this).transition(scale: 1.1, duration: 120)
      ->
        $(this).transition(scale: 1, duration: 500)
    )
