<?php

require __DIR__ . '/../../../../core/header.php';
require __DIR__ . '/../../../../core/Encryption.php';
require __DIR__ . '/../../../../core/functions.php';
require __DIR__ . '/../../../../models/developers/users/OtherUsers.php';

$conn    = null;
$conn    = checkDbConnection();
$val     = new OtherUsers($conn);
$encrypt = new Encryption();

$body = file_get_contents("php://input");
$data = json_decode($body, true);

if ($_SERVER['HTTP_AUTHORIZATION']) {
    checkPayload($data);
    $val->otheruser_password = $encrypt->doPasswordHash($data['new_password']);
    $val->otheruser_key      = $data['key'];
    $val->otheruser_updated  = date("Y-m-d H:i:s");
    $query = checkSetPassword($val);
    http_response_code(200);
    returnSuccess($val, "Other User set password", $query);
}

http_response_code(200);
checkAccess();