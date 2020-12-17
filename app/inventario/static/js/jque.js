$(document).ready(function(){
  recargarmarcaInicio();
  $("#sequipo").change(function() {
    recargarmarcalista();
  });
});

function baseUrl() {
  var href = window.location.href.split("/");
  return href[0] + "//" + href[2] + "/";
}

function recargarmarcaInicio() {
  var ev = $("#vmarca").val();
  var idequipo = $("#sequipo").val();
  var url1 = baseUrl();
  $.ajax({
    type: "GET",
    url: url1 + "obtener/Marca/" + idequipo + "/",
    dataType: "json",
    success: function(data) {
      if (data == null) {
        alert(`no se pudo traer datos`);
      } else {
        for (var i = 0; i <= data.length; i++) {
          var id_marca = data[i].id_marca;
          if (ev != id_marca) {
            $("#smarca").append(
              "<option value=" +
                id_marca +
                ">" +
                data[i].nombre_marca +
                "</option>"
            );
          }
        }
      }
    }
  });
}

function recargarmarcalista() {
  $('#smarca').empty();
  var idequipo = $("#sequipo").val();
  var url1 = baseUrl();
  $.ajax({
    type: "GET",
    url: url1 + "obtener/Marca/" + idequipo + "/",
    dataType: "json",
    success: function (data) {
      if (data == null) {
        alert(`no se pudo traer datos`);
      } else {
        for (var i = 0; i <= data.length; i++) {
          $("#smarca").append(
            "<option value=" + data[i].id_marca + ">" + data[i].nombre_marca + "</option>"
          );
        }
      }
    }
  });
}