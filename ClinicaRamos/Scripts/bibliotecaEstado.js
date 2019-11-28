$.get("Estado/listarEstado", function (data) {
    var contenido = "";
    contenido += "<table id='miTabla' class='table'>";
    contenido += "<thead>";
    contenido += "<tr>";
    contenido += "<td>Id</td>";
    contenido += "<td>Nombre</td>";
    contenido += "</tr>";
    contenido += "</thead>";

    contenido += "<tbody>";
    for (var i = 0; i < data.length; i++) {
        contenido += "<tr>";
        contenido += "<td>" + data[i].Id + "</td>";
        contenido += "<td>" + data[i].Nombre + "</td>";
        contenido += "</tr>";
    }
    contenido += "</tbody>";
    contenido += "</table>";
    document.getElementById("miTabla").innerHTML = contenido;
    $("#miTabla").DataTable();
});
