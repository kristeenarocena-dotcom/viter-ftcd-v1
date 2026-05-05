<?php

require __DIR__ . '/../../../../core/header.php';
require __DIR__ . '/../../../../core/Encryption.php';
require __DIR__ . '/../../../../core/functions.php';
require __DIR__ . '/../../../../models/developers/users/SystemUsers.php';

$conn    = null;
$conn    = checkDbConnection();
$val     = new SystemUsers($conn);
$encrypt = new Encryption();

$body = file_get_contents("php://input");
$data = json_decode($body, true);

if ($_SERVER['HTTP_AUTHORIZATION']) {
    checkPayload($data);
    $val->sysuser_password = $encrypt->doPasswordHash($data['new_password']);
    $val->sysuser_key      = $data['key'];
    $val->sysuser_updated  = date("Y-m-d H:i:s");
    $query = checkSetPassword($val);
    http_response_code(200);
    returnSuccess($val, "System User set password", $query);
}

http_response_code(200);
checkAccess();