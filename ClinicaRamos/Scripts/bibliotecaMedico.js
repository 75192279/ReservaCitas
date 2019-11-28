$.get("Especialidad/listarEspecialidad", function (data) {
    var contenido = "";
    contenido += "<select id='miCombo' >";

    for (var i = 0; i < data.length; i++) {
        contenido += "<option value=" +
            data[i].Id +
            ">" + data[i].Nombre +
            "</option>";
    }
    contenido += "</select>";
    document.getElementById("cmbEspecialidad").innerHTML = contenido; 
    document.getElementById("cmbEspecialidadParaEditar").innerHTML = contenido; 

});

$.get("Estado/listarEstado", function (data) {
    var contenido = "";
    contenido += "<select id='miCombo' >";

    for (var i = 0; i < data.length; i++) {
        contenido += "<option value=" +
            data[i].Id +
            ">" + data[i].Nombre +
            "</option>";
    }
    contenido += "</select>";
    document.getElementById("cmbEstado").innerHTML = contenido; 
    document.getElementById("cmbEstadoParaEditar").innerHTML = contenido;
});


var elBoton = document.getElementById("btnVer");
elBoton.onclick = function () {

    var LaLlavePrimaria = document.getElementById("cmbEspecialidad").value;
    var LaLlavePrimaria = document.getElementById("cmbEstado").value;
    $.get("Medico/listarPorEspecialidad/?argIdEspecialidad=" + LaLlavePrimaria, function (data) {

        var contenido = "";
        contenido += "<table id='miTabla' class='table'>";
        contenido += "<thead>";
        contenido += "<tr>";
        contenido += "<td>Id</td>";
        contenido += "<td>DNI</td>";
        contenido += "<td>Nombre</td>";
        contenido += "<td>Apellido Paterno</td>";
        contenido += "<td>Apellido Materno</td>";
        contenido += "<td>Telefono</td>";
        contenido += "<td>Estado</td>";
        contenido += "</tr>";
        contenido += "</thead>";

        contenido += "<tbody>";
        for (var i = 0; i < data.length; i++) {
            contenido += "<tr>";
            contenido += "<td>" + data[i].Id + "</td>";
            contenido += "<td>" + data[i].DNI + "</td>";
            contenido += "<td>" + data[i].Nombre + "</td>";
            contenido += "<td>" + data[i].ApellidoPaterno + "</td>";
            contenido += "<td>" + data[i].ApellidoMaterno + "</td>";
            contenido += "<td>" + data[i].telefono + "</td>";
            //contenido += "<td>" + data[i].EspecialidadDeMedico.Nombre + "</td>";
            contenido += "<td>" + data[i].EstadoDeMedico.Nombre + "</td>";
            contenido += "<td><button class='btn btn-primary' onclick=iniciarEdicion(" + data[i].Id + ") data-toggle='modal' data-target='#exampleModal'> <i class='glyphicon glyphicon-edit'></i></button> </td>";
            contenido += "<td><button class='btn btn-primary' onclick=iniciarEliminado(" + data[i].Id + ")>  <i class='glyphicon glyphicon-trash'></i></button> </td>";
            contenido += "</tr>";
        }
        contenido += "</tbody>";
        contenido += "</table>";
        document.getElementById("MedicosEncontrados").innerHTML = contenido;
    })
};



function iniciarEdicion(elIdCapturado) {

    $.get("Medico/Buscar_PorId/?argId=" + elIdCapturado, function (Datos) {

        for (var i = 0; i < Datos.length; i++) {
            document.getElementById("txtId").value = Datos[i].Id;
            document.getElementById("txtDNI").value = Datos[i].DNI;
            document.getElementById("txtNombre").value = Datos[i].Nombre;
            document.getElementById("txtApPaterno").value = Datos[i].ApellidoPaterno;
            document.getElementById("txtApMaterno").value = Datos[i].ApellidoMaterno;

            document.getElementById("txtTelefono").value = Datos[i].telefono;

            var elComboEstado = document.getElementById("cmbEstadoParaEditar");
            for (var k = 0; k < elComboEstado.length; k++) {
                if (elComboEstado[k].value == Datos[i].EstadoDeMedico.Id) {
                    document.getElementById("cmbEstadoParaEditar").selectedIndex = k;
                    break;
                }
            }


            var elComboEspecialidad = document.getElementById("cmbEspecialidadParaEditar");
            for (var k = 0; k < elComboEspecialidad.length; k++) {
                if (elComboEspecialidad[k].value == Datos[i].EspecialidadDeMedico.Id) {
                    document.getElementById("cmbEspecialidadParaEditar").selectedIndex = k;
                    break;
                }
            }


  

        }
    });
};

var botonGuardarModal = document.getElementById("btnGuardarDeModal");
botonGuardarModal.onclick = function () {
    GuardarDatos();
};



function GuardarDatos() {

    var IdExistente = document.getElementById("txtId").value;
    var DNINuevo = document.getElementById("txtDNI").value;
    var nombreNUEVO = document.getElementById("txtNombre").value;
    var paternoNUEVO = document.getElementById("txtApPaterno").value;
    var maternoNUEVO = document.getElementById("txtApMaterno").value;
    var telefonoNUEVO = document.getElementById("txtTelefono").value;
    var estadoNUEVO = document.getElementById("cmbEstadoParaEditar").value;
    var especialidadNUEVO = document.getElementById("cmbEspecialidadParaEditar").value;

    var Datos = new FormData();
    Datos.append("Id", IdExistente);
    Datos.append("DNI", DNINuevo);
    Datos.append("Nombre", nombreNUEVO);
    Datos.append("ApellidoPaterno", paternoNUEVO);
    Datos.append("ApellidoMaterno", maternoNUEVO);
    Datos.append("telefono", telefonoNUEVO);
    
  
    Datos.append("EstadoDeMedico.Id", estadoNUEVO);
    Datos.append("EspecialidadDeMedico.Id", especialidadNUEVO);
  

    $.ajax({
        type: "POST",
        url: "Medico/Editar",
        data: Datos,
        contentType: false,
        processData: false,
        success: function (resultado) {
            if (resultado == 'True') {
                alert("Datos guardados satisfactoriamente.");
            }
            else {
                alert("Ocurrió un error.");
            }
        }
    });
};