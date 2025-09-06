<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "1: Connection Failed";
        exit();
    }

    $userID = $_POST["userID"];
    $weaponID = $_POST["weaponID"];
    $weaponQuantity = $_POST["weaponQuantity"];

    $sql = "UPDATE user_weapon SET weaponQuantity = '".$weaponQuantity."' WHERE weaponID = '" .$weaponID. "' AND userID = '" .$userID. "';";

    $result = $con->query($sql);

    mysqli_query($con,$sql) or die('202: Save Error!!');

    $con->close();
?>