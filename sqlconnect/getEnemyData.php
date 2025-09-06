<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "1: Connection Failed";
        exit();
    }

    $stageID = $_POST["stageID"];

    $sql = "SELECT enemyID,atkbase,hpbase FROM user_stage NATURAL JOIN enemy WHERE stageID = '".$stageID."';";

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