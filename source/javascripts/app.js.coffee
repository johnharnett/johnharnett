class Coffee.AppHelper
  constructor: () ->
    console.log("running")
    this.setupLogoHover()

  setupLogoHover: () =>
    $("#logo-image").hover(
      ->
        $(this).transition(scale: 1.1, duration: 120)
      ->
        $(this).transition(scale: 1, duration: 500)
    )
