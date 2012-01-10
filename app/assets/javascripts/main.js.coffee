jQuery ->
  $("#send_message").click ->
    $.ajax
      type: "POST"
      url: "/messages"