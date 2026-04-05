<?php
$ini_array = parse_ini_file("/etc/measurements/ab.conf");



$dbconn = pg_connect("host=".$ini_array['server']." port=".$ini_array['port']." dbname=".$ini_array['dbname']." user=".$ini_array['user']." password=".$ini_array['password'])
or die ('Ошибка подключения: ' . pg_last_error());


$result = pg_query($dbconn, "SELECT m.measurement_id, t.tool_id, m.resource_id, t.name AS tool_name , m.system_name, m.value, m.unit, m.timestamp  FROM measurements m LEFT JOIN tools t ON m.tool_id = t.tool_id");

if (!$result) {
    echo "Ошибка выполнения запроса.\n";
    exit;
}

?>

<?php



$selected_system = isset($_POST['systems']) ? $_POST['systems'] : '';
$selected_types = isset($_POST['types']) ? $_POST['types'] : []; 


$query_m = "SELECT m.measurement_id, t.tool_id, m.resource_id, t.name AS tool_name, m.system_name, m.value, m.unit, m.timestamp 
            FROM measurements m 
            LEFT JOIN tools t ON m.tool_id = t.tool_id 
            WHERE 1=1"; 


if (!empty($selected_system)) {
    $query_m .= " AND m.system_name = '" . pg_escape_string($dbconn, $selected_system) . "'";
}


if (!empty($selected_types)) {

    $escaped_types = array_map(function($item) use ($dbconn) {
        return "'" . pg_escape_string($dbconn, $item) . "'";
    }, $selected_types);
    

    $query_m .= " AND t.name IN (" . implode(',', $escaped_types) . ")";
}

#echo "'$query_m'";

$result = pg_query($dbconn, $query_m);

if (!$result) {
    echo "Ошибка выполнения запроса.\n";
    exit;
}
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>test</title>
</head>
<body>
<p align="center"><b>Система мониторинга ресурсов</b></p>
<p align="center">Сегодня: <?php echo date('d.m.Y-l-F'); ?></p>


<form method="POST" id="filterForm">
    
    <?php
    $query_sys = 'SELECT system_id, system_name FROM systems';
    $result2 = pg_query($dbconn, $query_sys) or die ('error' . pg_last_error());

    echo '<center>';
    echo '<select name="systems" onchange="this.form.submit()">';
    echo '<option value="">Выберите систему</option>';
    while ($row = pg_fetch_assoc($result2)) {
        $is_selected = ($selected_system == $row['system_name']) ? 'selected' : '';
        echo '<option value="' . $row['system_name'] . '" ' . $is_selected . '>' . $row['system_name'] . '</option>';
    }
    echo '</select>';
    echo '</center>';
    ?>


    <p align="center">
        <label><input type="checkbox" name="types[]" value="free" onchange="this.form.submit()" <?php if(in_array('free', $selected_types)) echo 'checked'; ?>> RAM</label><br>
        <label><input type="checkbox" name="types[]" value="mpstat" onchange="this.form.submit()" <?php if(in_array('mpstat', $selected_types)) echo 'checked'; ?>> CPU</label><br>
        <label><input type="checkbox" name="types[]" value="df" onchange="this.form.submit()" <?php if(in_array('df', $selected_types)) echo 'checked'; ?>> DISK</label><br>
    </p>

</form>

<h1 align="center">Показания</h1>
<table border="1" align="center">
    <tr>
        <th>имя инструмента</th>
        <th>имя_системы</th>
        <th>показания</th>
        <th>единица</th>
        <th>временой промежуток</th>
    </tr>

    <?php
    while ($row = pg_fetch_assoc($result)) {
        echo "<tr>";           
        echo "<td>" . $row['tool_name'] . "</td>";
        echo "<td>" . $row['system_name'] . "</td>";
        echo "<td>" . $row['value'] . "</td>";
        echo "<td>" . $row['unit'] . "</td>";
        echo "<td>" . $row['timestamp'] . "</td>";
        echo "</tr>";
    }
    ?>
</table>

<?php
pg_close($dbconn);
?>

</body>
</html>
