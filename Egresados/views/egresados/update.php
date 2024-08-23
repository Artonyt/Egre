<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once '../../config/database.php';

$database = new Database();
$db = $database->getConnection();

if ($db === null) {
    echo "No se pudo conectar a la base de datos.";
    exit();
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Recibir y validar los datos del formulario
        $mes = $_POST['mes'];
        $nombres = $_POST['nombres'];
        $tipo_documento = $_POST['tipo_documento'];
        $numero_documento = $_POST['numero_documento'];
        $lugar_residencia = $_POST['lugar_residencia'];
        $direccion_residencia = $_POST['direccion_residencia'];
        $correo_electronico = $_POST['correo_electronico'];
        $telefono_celular = $_POST['telefono_celular'];
        $ocupacion_actual = $_POST['ocupacion_actual'];
        $vinculacion_patrocinio = $_POST['vinculacion_patrocinio'];
        $centro_formacion = $_POST['centro_formacion'];
        $ficha = $_POST['ficha'];
        $fecha_certificacion = $_POST['fecha_certificacion'];
        $estudios_adicionales = $_POST['estudios_adicionales'];
        $fecha_ultima_llamada = $_POST['fecha_ultima_llamada'];
        $numero_fijo = $_POST['numero_fijo'];
        $genero = $_POST['genero'];
        $otro_telefono_contacto = $_POST['otro_telefono_contacto'];
        $programa_formacion_id = $_POST['programa_formacion_id'];

        // Actualizar los datos en la base de datos
        $query = "UPDATE egresados SET MES = :mes, NOMBRES = :nombres, TipoDocumentoID = :tipo_documento, NumeroDocumento = :numero_documento, LugarResidenciaID = :lugar_residencia, DireccionResidencia = :direccion_residencia, CorreoElectronico = :correo_electronico, TelefonoCelular = :telefono_celular, OcupacionActual = :ocupacion_actual, VinculacionPatrocinio = :vinculacion_patrocinio, CentroFormacion = :centro_formacion, Ficha = :ficha, FechaCertificacion = :fecha_certificacion, EstudiosAdicionales = :estudios_adicionales, FechaUltimaLlamada = :fecha_ultima_llamada, NumeroFijo = :numero_fijo, Genero = :genero, OtroTelefonoContacto = :otro_telefono_contacto, ProgramaFormacionSENAID = :programa_formacion_id WHERE ID = :id";
        $stmt = $db->prepare($query);
        $stmt->bindParam(':mes', $mes);
        $stmt->bindParam(':nombres', $nombres);
        $stmt->bindParam(':tipo_documento', $tipo_documento);
        $stmt->bindParam(':numero_documento', $numero_documento);
        $stmt->bindParam(':lugar_residencia', $lugar_residencia);
        $stmt->bindParam(':direccion_residencia', $direccion_residencia);
        $stmt->bindParam(':correo_electronico', $correo_electronico);
        $stmt->bindParam(':telefono_celular', $telefono_celular);
        $stmt->bindParam(':ocupacion_actual', $ocupacion_actual);
        $stmt->bindParam(':vinculacion_patrocinio', $vinculacion_patrocinio);
        $stmt->bindParam(':centro_formacion', $centro_formacion);
        $stmt->bindParam(':ficha', $ficha);
        $stmt->bindParam(':fecha_certificacion', $fecha_certificacion);
        $stmt->bindParam(':estudios_adicionales', $estudios_adicionales);
        $stmt->bindParam(':fecha_ultima_llamada', $fecha_ultima_llamada);
        $stmt->bindParam(':numero_fijo', $numero_fijo);
        $stmt->bindParam(':genero', $genero);
        $stmt->bindParam(':otro_telefono_contacto', $otro_telefono_contacto);
        $stmt->bindParam(':programa_formacion_id', $programa_formacion_id);
        $stmt->bindParam(':id', $id);

        // Ejecutar la actualización
        try {
            $stmt->execute();
            // Redirigir de vuelta a la página de listado de egresados
            header("Location: index.php");
            exit();
        } catch (PDOException $e) {
            echo "Error al intentar actualizar el egresado: " . $e->getMessage();
        }
    } else {
        // Obtener los datos actuales del egresado para mostrar en el formulario
        $query = "SELECT * FROM egresados WHERE ID = :id";
        $stmt = $db->prepare($query);
        $stmt->bindParam(':id', $id);
        $stmt->execute();
        $egresado = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$egresado) {
            echo "Egresado no encontrado.";
            exit();
        }

        // Obtener los programas de formación para el campo de selección
        $query_programas = "SELECT ID, NombrePrograma FROM programaformacionsena";
        $stmt_programas = $db->query($query_programas);
        $programas = $stmt_programas->fetchAll(PDO::FETCH_ASSOC);

        // Mostrar los datos del egresado en el formulario
        ?>
        <!DOCTYPE html>
        <html lang="es">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Actualizar Egresado</title>
            <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
            <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    background-color: #f4f4f4;
                }
                .container {
                    width: 100%;
                    margin: 20px auto;
                    max-width: 800px;
                    padding: 20px;
                    background: #fff;
                    border-radius: 8px;
                    box-shadow: 0 0 10px rgba(0,0,0,0.1);
                    position: relative;
                }
                h1 {
                    text-align: center;
                    color: #4CAF50;
                }
                form {
                    display: flex;
                    flex-direction: column;
                }
                label {
                    margin: 10px 0 5px;
                    font-weight: bold;
                }
                input, select {
                    margin-bottom: 15px;
                    padding: 8px;
                    border: 1px solid #d1bda1;
                    border-radius: 4px;
                }
                input[type="submit"] {
                    background-color: #4CAF50;
                    color: white;
                    border: none;
                    cursor: pointer;
                    padding: 10px;
                    border-radius: 4px;
                }
                input[type="submit"]:hover {
                    background-color: #45a049;
                }
                .button-row {
                    text-align: center;
                    margin-top: 20px;
                }
                .btn-back {
                    background-color: #2196F3;
                    color: white;
                    border: none;
                    padding: 10px 20px;
                    text-decoration: none;
                    border-radius: 4px;
                }
                .btn-back:hover {
                    background-color: #1976D2;
                }
                .back-button {
                    position: absolute;
                    top: 10px;
                    left: 10px;
                    background-color: #2196F3;
                    color: white;
                    border: none;
                    padding: 10px;
                    border-radius: 50%;
                    cursor: pointer;
                    font-size: 16px;
                    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
                }
                .back-button:hover {
                    background-color: #1976D2;
                }
                .back-button i {
                    margin: 0;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <button class="back-button" onclick="window.location.href='index.php'">
                    <i class="fas fa-arrow-left"></i>
                </button>
                <h1>Actualizar Egresado</h1>
                <form action="update.php?id=<?php echo htmlspecialchars($id); ?>" method="post">
                    <!-- Campos del formulario -->
                    <label for="mes">Mes:</label>
                    <input type="text" id="mes" name="mes" value="<?php echo htmlspecialchars($egresado['MES']); ?>">

                    <label for="nombres">Nombres:</label>
                    <input type="text" id="nombres" name="nombres" value="<?php echo htmlspecialchars($egresado['NOMBRES']); ?>">

                    <label for="tipo_documento">Tipo Documento:</label>
                    <input type="text" id="tipo_documento" name="tipo_documento" value="<?php echo htmlspecialchars($egresado['TipoDocumentoID']); ?>">

                    <label for="numero_documento">Número Documento:</label>
                    <input type="text" id="numero_documento" name="numero_documento" value="<?php echo htmlspecialchars($egresado['NumeroDocumento']); ?>">

                    <label for="lugar_residencia">Lugar Residencia:</label>
                    <input type="text" id="lugar_residencia" name="lugar_residencia" value="<?php echo htmlspecialchars($egresado['LugarResidenciaID']); ?>">

                    <label for="direccion_residencia">Dirección Residencia:</label>
                    <input type="text" id="direccion_residencia" name="direccion_residencia" value="<?php echo htmlspecialchars($egresado['DireccionResidencia']); ?>">

                    <label for="correo_electronico">Correo Electrónico:</label>
                    <input type="email" id="correo_electronico" name="correo_electronico" value="<?php echo htmlspecialchars($egresado['CorreoElectronico']); ?>">

                    <label for="telefono_celular">Teléfono Celular:</label>
                    <input type="text" id="telefono_celular" name="telefono_celular" value="<?php echo htmlspecialchars($egresado['TelefonoCelular']); ?>">

                    <label for="ocupacion_actual">Ocupación Actual:</label>
                    <input type="text" id="ocupacion_actual" name="ocupacion_actual" value="<?php echo htmlspecialchars($egresado['OcupacionActual']); ?>">

                    <label for="vinculacion_patrocinio">Vinculación Patrocinio:</label>
                    <input type="text" id="vinculacion_patrocinio" name="vinculacion_patrocinio" value="<?php echo htmlspecialchars($egresado['VinculacionPatrocinio']); ?>">

                    <label for="centro_formacion">Centro Formación:</label>
                    <input type="text" id="centro_formacion" name="centro_formacion" value="<?php echo htmlspecialchars($egresado['CentroFormacion']); ?>">

                    <label for="ficha">Ficha:</label>
                    <input type="text" id="ficha" name="ficha" value="<?php echo htmlspecialchars($egresado['Ficha']); ?>">

                    <label for="fecha_certificacion">Fecha Certificación:</label>
                    <input type="date" id="fecha_certificacion" name="fecha_certificacion" value="<?php echo htmlspecialchars($egresado['FechaCertificacion']); ?>">

                    <label for="estudios_adicionales">Estudios Adicionales:</label>
                    <input type="text" id="estudios_adicionales" name="estudios_adicionales" value="<?php echo htmlspecialchars($egresado['EstudiosAdicionales']); ?>">

                    <label for="fecha_ultima_llamada">Fecha Última Llamada:</label>
                    <input type="date" id="fecha_ultima_llamada" name="fecha_ultima_llamada" value="<?php echo htmlspecialchars($egresado['FechaUltimaLlamada']); ?>">

                    <label for="numero_fijo">Número Fijo:</label>
                    <input type="text" id="numero_fijo" name="numero_fijo" value="<?php echo htmlspecialchars($egresado['NumeroFijo']); ?>">

                    <label for="genero">Género:</label>
                    <input type="text" id="genero" name="genero" value="<?php echo htmlspecialchars($egresado['Genero']); ?>">

                    <label for="otro_telefono_contacto">Otro Teléfono de Contacto:</label>
                    <input type="text" id="otro_telefono_contacto" name="otro_telefono_contacto" value="<?php echo htmlspecialchars($egresado['OtroTelefonoContacto']); ?>">

                    <label for="programa_formacion_id">Programa de Formación SENA:</label>
                    <select id="programa_formacion_id" name="programa_formacion_id">
                        <?php foreach ($programas as $programa): ?>
                            <option value="<?php echo htmlspecialchars($programa['ID']); ?>" <?php echo ($egresado['ProgramaFormacionSENAID'] == $programa['ID']) ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($programa['NombrePrograma']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>

                    <input type="submit" value="Actualizar">
                </form>
            </div>
        </body>
        </html>
        <?php
    }
} else {
    echo "ID no proporcionado.";
}
?>
