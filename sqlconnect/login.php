<?php
    $con = mysqli_connect('localhost','root','','square');

    if(mysqli_connect_errno()){
        echo "6: Connection Failed";
        exit();
    }

    $username = $_POST["name"];
    $password = $_POST["password"];

    //mengecek apakah nama tersebut sudah ada atau belum
    $namecheckquery = "SELECT username, salt, hash, userID FROM users WHERE username = '"   .$username.   "';";

    $namecheck = mysqli_query($con, $namecheckquery) or die("6: Name check query failed");
    
    if (mysqli_num_rows($namecheck) != 1){
        echo "6: No user with name or more than one";
        exit();
    }

    $existinginfo = mysqli_fetch_assoc($namecheck);
    $salt = $existinginfo["salt"];
    $hash = $existinginfo["hash"];

    $loginhash = crypt($password, $salt);
    if ($hash != $loginhash){
        echo "6: Incorrect Password"; 
        exit();
    }

    echo "".$existinginfo["userID"];


?>