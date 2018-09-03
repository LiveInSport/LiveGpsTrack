<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
</head>
<body>
<?php

$serverName = "den1.mssql4.gear.host";
$connectionInfo = array( "Database"=>"livtrack", "UID"=>"livtrack", "PWD"=>"L!vTracker");
$SQLKEY="secret";

$conn = sqlsrv_connect( $serverName, $connectionInfo);


if( $conn ) {
echo "Connected OK10.";
}else{
echo "Connection fail.<br />";
die( print_r( sqlsrv_errors(), true));
}


$track = ($conn, $_POST['track']);
	

$sql = "INSERT INTO tracks (track) VALUES (?)";
$params = array($track);

$stmt = sqlsrv_query( $conn, $sql, $params);
if( $stmt === false ) {
     die( print_r( sqlsrv_errors(), true));
}

?>
</body>
</html>