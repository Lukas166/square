<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "1: Connection Failed";
        exit();
    }

    $userID = $_POST["userID"];

    $sql = "SELECT weapons.WeaponID,weaponName,atkmul,hpmul,weaponQuantity FROM user_weapon NATURAL JOIN weapons WHERE userID = '".$userID."';";

    $result = $con->query($sql);
    
    $rows = array();

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $rows[] = $row;
        }
        echo json_encode($rows);
    } else {
        echo "0";
    }
    $con->close();
?>