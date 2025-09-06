<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "1: Connection Failed";
        exit();
    }

    $userID = $_POST["userID"];
    $hplvl = $_POST["hplvl"];
    $atklvl = $_POST["atklvl"];
    $lucklvl = $_POST["lucklvl"];
    $gems = $_POST["gems"];
    $coins = $_POST["coins"];

    $sql = "UPDATE users SET hplvl = '".$hplvl."', atklvl = '".$atklvl."', lucklvl = '".$lucklvl."', gems = '".$gems."', coins = '".$coins."' WHERE userID = '" .$userID. "'";

    mysqli_query($con,$sql) or die('202: Save Error!!');

    $sql2 = "INSERT INTO user_stage VALUES ('" .$userID. "', 'FO001');";

    mysqli_query($con,$sql2) or die('202: Stage Save Error!!');

    $con->close();
?>