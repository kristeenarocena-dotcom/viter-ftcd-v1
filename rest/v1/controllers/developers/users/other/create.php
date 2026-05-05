<?php

// import notification
require __DIR__ . '/../../../../notifications/verify-account.php';

$conn    = null;
$conn    = checkDbConnection();
$val     = new OtherUsers($conn);
$encrypt = new Encryption();

$val->otheruser_is_active = isset($data['otheruser_is_active']) ? (int) $data['otheruser_is_active'] : 1;
$val->otheruser_full_name = trim($data['otheruser_full_name']);
$val->otheruser_email     = trim($data['otheruser_email']);
$val->otheruser_password  = '';
$val->otheruser_key       = $encrypt->doHash(rand());
$val->otheruser_role_id   = isset($data['otheruser_role_id']) ? (int) $data['otheruser_role_id'] : 0;
$val->otheruser_created   = date("Y-m-d H:i:s");
$val->otheruser_updated   = date("Y-m-d H:i:s");
$password_link            = "/create-password";

// validations
isEmailExist($val, $val->otheruser_email);

$emailSendCount = 0;
$query = checkCreate($val);
if ($query->rowCount() > 0) {
    $sendEmail = sendEmail(
        $password_link,
        $val->otheruser_full_name,
        $val->otheruser_email,
        $val->otheruser_key,
    );
    if ($sendEmail['mail_success']) $emailSendCount++;
}
http_response_code(200);
returnSuccess($val, "Other Users Create", $query, $emailSendCount);