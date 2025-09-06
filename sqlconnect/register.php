<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "1: Connection Failed";
        exit();
    }

    $username = $_POST["name"];
    $password = $_POST["password"];

    $namecheckquery = "SELECT username FROM users WHERE username = '"   .$username.   "';";

    $namecheck = mysqli_query($con, $namecheckquery) or die("2: Name check query failed");

    if(mysqli_num_rows($namecheck) > 0){
        echo "3: Name already exists";
        exit();
    }

    $salt = "\$5\$rounds=5000\$" . "steamedhams" . $username . "\$";
    $hash = crypt($password, $salt);
    $insertuserquery = "INSERT INTO users (username,hash,salt) VALUES ('"  .$username.   "','"   .$hash.   "','"   .$salt.   "');";
    mysqli_query($con,$insertuserquery) or die("4: Insert player query failed");

    $updateuserquery = "UPDATE users SET hplvl = 1, atklvl = 1, lucklvl = 1, gems = 100, coins = 500 WHERE username = '$username';";
    $updateuser = mysqli_query($con, $updateuserquery);

    if (!$updateuser) {
        die("5: Update player stats query failed"); // Error code #5: Update player stats query failed
    }

    echo("0");
?>