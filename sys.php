<?php

$ini_array = parse_ini_file("/etc/measurements/ab.conf");





$dbconn = pg_connect("host=".$ini_array['server']." port=".$ini_array['port']." dbname=".$ini_array['dbname']." user=".$ini_array['user']." password=".$ini_array['password'])
or die ('Ошибка подключения: ' . pg_last_error());

$os_name = system("uname -o");

$os_version = system("uname -v");

$architecture = system("uname -m");

$system_name = system("uname -n");

$kernal_name = system("uname -r");


$query = 'UPDATE systems SET  os_name='.$os_name.', os_version='.$os_version.' ,architecture='.$architecture.', system_name='.$system_name.', kernel_name='.$kernal_name.' WHERE systems.system_name = '.$system_name;
echo $query;
$result = pg_query($dbconn, $query);
#$result = pg_query($dbconn, $query, array($os_name, $os_version, $architecture, $system_name, $kernal_name));


if ($result) {
    echo "Измерение успешно записано.";
} else {
    echo "Ошибка записи: " . pg_last_error($dbconn);
}


pg_close($dbconn);

?>
