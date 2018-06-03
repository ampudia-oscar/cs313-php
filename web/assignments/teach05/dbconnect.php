<?php

$dbUrl = getenv('DATABASE_URL');

$dbopts = parse_url($dbUrl);

$dbHost = $dbopts["host"];
$dbPort = $dbopts["port"];
$dbUser = $dbopts["user"];
$dbPassword = $dbopts["pass"];
$dbName = ltrim($dbopts["path"],'/');

try
{
  $db = new PDO("pgsql:host=$dbHost;port=$dbPort;dbname=$dbName", $dbUser, $dbPassword);
}
catch (PDOException $ex)
{
  echo 'Error!: ' . $ex->getMessage();
  die();
}

//$dsn = 'pgsql:host=127.0.0.1;dbname=ampudia';
//$username = 'ampudia';
//$password = '.rinoa.4';
//$options = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION);
//
//try {
//    $db = new PDO($dsn, $username, $password, $options);
//} catch (PDOException $e) {
//    echo 'Error: ' . $e->getMessage();
//    exit;
//}
