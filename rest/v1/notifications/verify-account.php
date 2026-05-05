<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

include_once("mail-config.php");
include_once("templates/verify-account.php");

function sendEmail($password_link, $name, $email, $key)
{
    try {
        $mail = new PHPMailer(true);
        $mail->isSMTP();
        $mail->Host       = HOST;
        $mail->Port       = PORT;
        $mail->SMTPSecure = SMTPSECURE;
        $mail->SMTPAuth   = true;
        $mail->Username   = USERNAME;
        $mail->Password   = PASSWORD;
        $mail->Subject    = VERIFY_ACCOUNT;
        $mail->setFrom(USERNAME, FROM);
        $mail->isHTML(true);
        $mail->Body = getHtmlVerifyAccount(
            $password_link,
            $name,
            $email,
            $key,
            ROOT_DOMAIN,
            IMAGES_URL
        );

        if ($email != "") {
            $mail->addAddress($email);
            if ($mail->Send()) {
                return ["mail_success" => true,  "error" => "No Error.", "email" => $email];
            } else {
                return ["mail_success" => false, "error" => "Could not send email. Please try again."];
            }
        } else {
            return ["mail_success" => false, "error" => "No email receiver found."];
        }
    } catch (Exception $e) {
        return [
            "mail_error"   => $e->getMessage(),
            "error"        => "Could not authenticate. Check your email credentials.",
            "mail_success" => false
        ];
    }
}