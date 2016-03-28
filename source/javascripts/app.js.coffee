class Coffee.AppHelper

  constructor: () ->
    $(".page-visible")
      .transition({opacity: 1, top: 0, duration: 300, easing: 'ease'})

    @dataRef = new Firebase('')

    $("#remove-line-button").click =>
      removeComplete= (error) =>
        $('#messagesDiv').val('')
#        if (error)
#          alert('Synchronization failed.')
#        else
#          alert('Synchronization succeeded.')

      @dataRef.remove(removeComplete)

    this._setupLogoHover()

    $('#messageInput').keypress((e) =>
      if (e.keyCode == 13)
        name = $('#nameInput').val()
        text = $('#messageInput').val()

        if name.length == 0
          name = 'anonymous'
        if text.length == 0
          text = 'silence'

        @dataRef.push({name: name, text: text})
        $('#messageInput').val('')
    )

    @dataRef.on('child_added', (snapshot) =>
      message = snapshot.val()
      this.displayChatMessage(message.name, message.text)
    )
    @dataRef.on('child_removed', (oldChildSnapshot) =>
      $('#messagesDiv').val('')
    )

  displayChatMessage: (name, text) =>
    $('<div/>').text(text).prepend($('<em/>').text(name+': ')).appendTo($('#messagesDiv'))
    $('#messagesDiv').val($('#messagesDiv').val() + name + ": " + text + "\n")
    $('#messagesDiv')[0].scrollTop = $('#messagesDiv')[0].scrollHeight

  _setupLogoHover: () =>
    $("#logo-image").hover(
      ->
        $(this).transition(scale: 1.1, duration: 120)
      ->
        $(this).transition(scale: 1, duration: 500)
    )




