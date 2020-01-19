$(document).ready(function() {
  recargarlista();
  $("#sarea").change(function() {
    recargarlista();
  });

  $("#botonbuscar").click(function() {
    recargartabla();
  });
});

function baseUrl() {
  var href = window.location.href.split("/");
  return href[0] + "//" + href[2] + "/";
}

function recargarlista() {
  $("#sempleado").empty();
  var idarea = $("#sarea").val();
  var url1 = baseUrl();
  $.ajax({
    type: "GET",
    url: url1 + "obtener/" + idarea + "/",
    dataType: "json",
    success: function(data) {
      if (data == null) {
        alert(`no se pudo traer datos`);
      } else {
        for (var i = 0; i <= data.length; i++) {
          var dni = data[i].dni_empleado;
          $("#sempleado").append(
            "<option value=" + dni + ">" + data[i].nombre_empleado + "</option>"
          );
        }
      }
    }
  });
}
