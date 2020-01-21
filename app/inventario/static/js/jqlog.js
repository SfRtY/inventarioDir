$(document).ready(function() {
  $("#botonLogin").click(function() {
    envio();
  });
});

function baseUrl() {
  var href = window.location.href.split("/");
  return href[0] + "//" + href[2] + "/";
}

function envio() {
  var url1 = baseUrl();
  alert("envio");
  $.ajax({
    type: "POST",
    url: url1 + "User/Login/",
    dataType: "json",
    async:false,
    data: {
      username: $("#usuario").val(),
      password: $("#password").val(),
      csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()
    },
    success: function(data) {
      if (data != null) {
        alert(data.token);
      } 
    }
  });
}
