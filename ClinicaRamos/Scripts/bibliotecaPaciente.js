$.get("Paciente/listarPaciente", function (data) {
    var contenido = "";
    contenido += "<table id='miTabla' class='table'>";
    contenido += "<thead>";
    contenido += "<tr>";
    contenido += "<td>DNI</td>";
    contenido += "<td>Nombres</td>";
    contenido += "<td>ApellidoPaterno</td>";
    contenido += "<td>ApellidoMaterno</td>";
    contenido += "<td>Correo</td>";
    contenido += "<td>Direccion</td>";
    contenido += "<td>Genero</td>";
    contenido += "</tr>";
    contenido += "</thead>";

    contenido += "<tbody>";
    for (var i = 0; i < data.length; i++) {
        contenido += "<tr>";
        contenido += "<td>" + data[i].DNI + "</td>";
        contenido += "<td>" + data[i].Nombres + "</td>";
        contenido += "<td>" + data[i].ApellidoPaterno + "</td>";
        contenido += "<td>" + data[i].ApellidoMaterno + "</td>";
        contenido += "<td>" + data[i].Correo + "</td>";
        contenido += "<td>" + data[i].Direccion + "</td>";
        contenido += "<td>" + data[i].Genero + "</td>";
        contenido += "</tr>";
    }
    contenido += "</tbody>";
    contenido += "</table>";
    document.getElementById("miTabla").innerHTML = contenido;

});










