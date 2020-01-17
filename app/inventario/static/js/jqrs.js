function recargartabla() {
  $("#tbody").empty();
  $("#errorbuscar").empty();
  var dniempleado = $("#sempleado").val();
  var url1 = baseUrl();
  $.ajax({
    type: "GET",
    url: url1 + "Software/BuscarByEmpleado/" + dniempleado + "/",
    dataType: "json",
    success: function(data) {
      if (data == null) {
        alert(`no se pudo traer datos`);
      } else {
        if (data.length == 0) {
          $("#errorbuscar").append(
            "<div class='col-12 alert alert-danger' role='alert'>NO SE ENCONTRARON INVENTARIOS CON ESTE EMPLEADO</div>"
          );
        } else {
          for (var i = 0; i <= data.length; i++) {
            var funcion = "eliminarsino(" + data[i].id_software + ")";
            var url_actualizar =
              "'/Software/Actualizar/" + data[i].id_software + "/'";
            $("#tbody").append(
              "<tr><th scope='row'>" +
                i +
                "</th><td>" +
                data[i].nombre_software +
                "</td><td>" +
                data[i].version_software +
                "</td><td>" +
                data[i].tipo_equipo_s +
                "</td><td>" +
                data[i].sistema_operativo +
                "</td><td>" +
                data[i].codigo_bien_s +
                "</td><td><a class='btn btn-warning btn-sm' href=" +
                url_actualizar +
                ">Actualizar</a></td><td><a class='btn btn-danger btn-sm' onclick='" +
                funcion +
                "')'>Eliminar</a></td></tr>"
            );
          }
        }
      }
    }
  });
}

function eliminarsino(id) {
  alertify.confirm(
    "ELIMINAR INVENTARIO SOFTWARE",
    "Estas seguro de eliminar este registro de inventario",
    function() {
      eliminar(id);
    },
    function() {}
  );
}

function eliminar(id) {
  var idsoftware = id;
  var url1 = baseUrl();
  $.ajax({
    type: "POST",
    url: url1 + "Software/Eliminar/" + idsoftware + "/",
    success: function(response) {
      console.log(response);
      recargartabla();
    },
    error: function(response) {
      console.log(response);
    }
  });
}
