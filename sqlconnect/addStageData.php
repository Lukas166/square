<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "1: Connection Failed";
        exit();
    }

    $userID = $_POST["userID"];
    $stageID = $_POST["weaponID"];

    $sql = "INSERT INTO user_stage VALUES (" .$userID. ", '" .$stageID. "');";

    $result = $con->query($sql);

    mysqli_query($con,$sql) or die('202: Save Error!!');

    $con->close();
?>