<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "1: Connection Failed";
        exit();
    }

    $userID = $_POST["userID"];
    $weaponID = $_POST["weaponID"];

    $sql = "SELECT weaponName, atkmul, hpmul, weaponQuantity FROM user_weapon NATURAL JOIN weapons WHERE weaponID = '" .$weaponID. "' AND userID = '".$userID."';";

    $result = $con->query($sql);

    if (mysqli_num_rows($result) == 1){
        $rows = mysqli_fetch_assoc($result);
        echo json_encode($rows);
    } else {
        echo "0";
    }
    $con->close();
?>