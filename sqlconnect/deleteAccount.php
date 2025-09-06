<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "1: Connection Failed";
        exit();
    }

    $userID = $_POST["userID"];
    $stageID = $_POST["weaponID"];

    $sql1 = "DELETE FROM user_stage WHERE userID = " .$userID. ";";
    $sql2 = "DELETE FROM user_weapon WHERE userID = " .$userID. ";";
    $sql3 = "DELETE FROM users WHERE userID = " .$userID. ";";

    mysqli_query($con,$sql1) or die('Delete stage error!!');
    mysqli_query($con,$sql2) or die('Delete weapon error!!');
    mysqli_query($con,$sql3) or die('Delete users error!!');

    $con->close();
?>