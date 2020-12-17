function recargartabla() {
  $("#tbody").empty();
  $("#errorbuscar").empty();
  var dniempleado = $("#sempleado").val();
  var url1 = baseUrl();
  $.ajax({
    type: "GET",
    url: url1 + "Hardware/Equipo/BuscarByEmpleado/" + dniempleado + "/",
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
            var funcion = "eliminarsino(" + data[i].id_hardware_periferico + ")";
            var url_actualizar =
              "'/Hardware/Equipo/Actualizar/" + data[i].id_hardware_periferico + "/'";
            $("#tbody").append(
              "<tr><th scope='row' class='prioridad-1'>" +
                i +
                "</th><td class='prioridad-2'>" +
                data[i].nombre_hardware_periferico +
                "</td><td class='prioridad-3'>" +
                data[i].marca +
                "</td><td class='prioridad-4'>" +
                data[i].modelo +
                "</td><td class='prioridad-5'>" +
                data[i].estado +
                "</td><td class='prioridad-6'>" +
                data[i].numero_serie +
                "</td><td class='prioridad-7'><a class='btn btn-warning btn-sm' href=" +
                url_actualizar +
                ">Actualizar</a></td><td class='prioridad-8'><a class='btn btn-danger btn-sm' onclick='" +
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
    data:{'csrfmiddlewaretoken':Cookies.get('csrftoken')},
    url: url1 + "Hardware/Equipo/Eliminar/" + idhw + "/",
    success: function(response) {
      console.log(response);
      recargartabla();
    },
    error: function(response) {
      console.log(response);
    }
  });
}
