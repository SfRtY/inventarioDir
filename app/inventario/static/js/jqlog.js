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
  var request=$.ajax({
    type: "POST",
    url: url1 + "User/Login/",
    dataType: "json",
    data: {
      username: $("#usuario").val(),
      password: $("#password").val()
    },
  });
  request.done(function(response,status){
    console.log(response);
});
request.fail(function() {
    alert("Hubo un error: ");
});

}
