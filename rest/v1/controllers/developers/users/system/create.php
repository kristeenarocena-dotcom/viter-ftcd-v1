<?php

// import notification
require __DIR__ . '/../../../../notifications/verify-account.php';

$conn  = null;
$conn  = checkDbConnection();
$val   = new SystemUsers($conn);
$encrypt = new Encryption();

$val->sysuser_is_active  = isset($data['sysuser_is_active']) ? (int) $data['sysuser_is_active'] : 1;
$val->sysuser_full_name  = trim($data['sysuser_full_name']);
$val->sysuser_email      = trim($data['sysuser_email']);
$val->sysuser_password   = '';
$val->sysuser_key        = $encrypt->doHash(rand());
$val->sysuser_role_id    = isset($data['sysuser_role_id']) ? (int) $data['sysuser_role_id'] : 0;
$val->sysuser_created    = date("Y-m-d H:i:s");
$val->sysuser_updated    = date("Y-m-d H:i:s");
$password_link           = "/create-password";

// validations
isEmailExist($val, $val->sysuser_email);

$emailSendCount = 0;
$query = checkCreate($val);
if ($query->rowCount() > 0) {
    $sendEmail = sendEmail(
        $password_link,
        $val->sysuser_full_name,
        $val->sysuser_email,
        $val->sysuser_key,
    );
    if ($sendEmail['mail_success']) $emailSendCount++;
}
http_response_code(200);
returnSuccess($val, "System Users Create", $query, $emailSendCount);