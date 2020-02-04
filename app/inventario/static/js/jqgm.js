$(document).ready(function () {
  recargarMarca();
  $('#sequipo').change(function () {
    recargarMarca();
  }
  );
});

function baseUrl() {
  var href = window.location.href.split("/");
  return href[0] + "//" + href[2] + "/";
}

function recargarMarca() {
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
