<?php

require __DIR__ . '/../../../../core/header.php';
require __DIR__ . '/../../../../core/functions.php';
require __DIR__ . '/../../../../models/developers/users/SystemUsers.php';

$conn = null;
$conn = checkDbConnection();
$val  = new SystemUsers($conn);

$body = file_get_contents("php://input");
$data = json_decode($body, true);

if ($_SERVER['HTTP_AUTHORIZATION']) {
    if (array_key_exists('key', $_GET)) {
        $val->sysuser_key = $_GET['key'];
        $query = checkReadKey($val);
        http_response_code(200);
        getQueriedData($query);
    }
    checkEndpoint();
}

http_response_code(200);
checkAccess();