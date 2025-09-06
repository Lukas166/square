<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "1: Connection Failed";
        exit();
    }

    $userID = $_POST["userID"];

    $sql = "SELECT hplvl,atklvl,lucklvl,gems,coins FROM users WHERE userID = '" .$userID. "'";

    $result = $con->query($sql);

    if (mysqli_num_rows($result) == 1){
        $rows = mysqli_fetch_assoc($result);
        echo json_encode($rows);
    } else {
        echo "0";
    }
    $con->close();
?>