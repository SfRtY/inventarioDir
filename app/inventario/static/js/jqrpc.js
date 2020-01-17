function recargartabla() {
  $("#tbody").empty();
  $("#errorbuscar").empty();
  var dniempleado = $("#sempleado").val();
  var url1 = baseUrl();
  $.ajax({
    type: "GET",
    url: url1 + "Hardware/PC/BuscarByEmpleado/" + dniempleado + "/",
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
            var funcion = "eliminarsino(" + data[i].id_pc + ")";
            var url_actualizar =
              "'/Hardware/PC/Actualizar/" + data[i].id_pc + "/'";
            $("#tbody").append(
              "<tr><th scope='row'>" +
                i +
                "</th><td>" +
                data[i].procesador_pc +
                "</td><td>" +
                data[i].velocidad_pc +
                "</td><td>" +
                data[i].memoria_ram +
                "</td><td>" +
                data[i].almacenamiento +
                "</td><td>" +
                data[i].tipo_equipo +
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
  var idhw = id;
  var url1 = baseUrl();
  $.ajax({
    type: "POST",
    url: url1 + "Hardware/PC/Eliminar/" + idhw + "/",
    success: function(response) {
      console.log(response);
      recargartabla();
    },
    error: function(response) {
      console.log(response);
    }
  });
}
