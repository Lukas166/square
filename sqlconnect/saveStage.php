<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "1: Connection Failed";
        exit();
    }

    $userID = $_POST["userID"];
    $stageID = $_POST["stageID"];

    $sql = "INSERT INTO user_stage VALUES ('" .$userID. "', '" .$stageID. "')";

    mysqli_query($con,$sql) or die('202: Stage Save Error!!');

    $con->close();
?>