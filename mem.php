<?php

$ini_array = parse_ini_file("/etc/measurements/ab.conf");





$dbconn = pg_connect("host=".$ini_array['server']." port=".$ini_array['port']." dbname=".$ini_array['dbname']." user=".$ini_array['user']." password=".$ini_array['password'])
or die ('Ошибка подключения: ' . pg_last_error());

$value_obsh = system("df -m | awk '$1 == \"/dev/vda3\" {print $2}'");

$value_svob = system("df -m | awk '$1 == \"/dev/vda3\" {print $4}'");



echo $value_obsh;
echo $value_svob;

$hostname = system("hostname");

$unit = "MB";



$query = 'INSERT INTO measurements (tool_id, resource_id, system_name ,value, unit, timestamp) VALUES ($1, $2, $3, $4, $5, NOW())';
$result = pg_query_params($dbconn, $query, array(4, 4, $hostname, $value_obsh, $unit));

if ($result) {
    echo "Измерение успешно записано.";
} else {
    echo "Ошибка записи: " . pg_last_error($dbconn);
}

$query = 'INSERT INTO measurements (tool_id, resource_id, system_name ,value, unit, timestamp) VALUES ($1, $2, $3, $4, $5, NOW())';
$result = pg_query_params($dbconn, $query, array(4, 5, $hostname, $value_svob, $unit));

if ($result) {
    echo "Измерение успешно записано.";
} else {
    echo "Ошибка записи: " . pg_last_error($dbconn);
}


pg_close($dbconn);

?>
