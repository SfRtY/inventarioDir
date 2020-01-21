$(document).ready(function() {
  $("#botonLogin").click(function() {
    $('#error').empty();
    if($("#usuario").val()=='' && $("#password").val()==''){
      $('#error').append("<div class='alert alert-danger'role='alert'> Ingresar datos </div>");
    }
    else{
      envio();  
    }
  });
});

function baseUrl() {
  var href = window.location.href.split("/");
  return href[0] + "//" + href[2] + "/";
}

function envio() {
  var url1 = baseUrl();
  $.ajax({
    type: "POST",
    url: url1 + "User/Login/",
    dataType: "json",
    data: {
      username: $("#usuario").val(),
      password: $("#password").val(),
      csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()
    },
    success: function(data) {
      if (data != null) {
        alert(data.token);
        Cookies.set('token',data.token);
      }
    },
    error: function(){
      $('#error').append("<div class='alert alert-danger'role='alert'> El usuario o la contraseña es incorrecta </div>");
    }
  });
}
