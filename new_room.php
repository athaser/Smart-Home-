<?php
	require 'init.php';
	//$myStr=$_POST['myStr'];
	$myStr="1///roomname///1///false///true///false///true///false///false///false///false///false///";

	$pieces = explode("///", $myStr);
	$id=$pieces[0]; 
	$RoomName=$pieces[1];
	$RoomType=$pieces[2]; 
	$TemperatureExists= $pieces[3]; 
	$HumidityExists=$pieces[4]; 
	$LuminocityExists=$pieces[5]; 
	$Switch1Exists=$pieces[6]; 
	$Switch2Exists=$pieces[7]; 
	$Switch3Exists=$pieces[8]; 
	$Switch4Exists=$pieces[9]; 
	$Switch5Exists=$pieces[10]; 
	$Switch6Exists=$pieces[11]; 

	try
	{
		
			$query=$dbh -> prepare("INSERT INTO `rooms`(`RoomName`, `RoomType`, `id`, `TemperatureExists`, `HumidityExists`, 
				 `LuminocityExists`, `Switch1Exists`, `Switch2Exists`, `Switch3Exists`, `Switch4Exists`, 
				 `Switch5Exists`, `Switch6Exists`) VALUES (:RoomName,:RoomType,:id,:TemperatureExists,:HumidityExists,
				 :LuminocityExists,:Switch1Exists,:Switch2Exists,:Switch3Exists,:Switch4Exists,:Switch5Exists,:Switch6Exists)");
			
			$query->bindparam(":id",$id);
			$query->bindparam(":RoomName",$RoomName);
			$query->bindparam(":RoomType",$RoomType);
			$query->bindparam(":TemperatureExists",$TemperatureExists);
			$query->bindparam(":HumidityExists",$HumidityExists);
			$query->bindparam(":LuminocityExists",$LuminocityExists);
			$query->bindparam(":Switch1Exists",$Switch1Exists);
			$query->bindparam(":Switch2Exists",$Switch2Exists);
			$query->bindparam(":Switch3Exists",$Switch3Exists);
			$query->bindparam(":Switch4Exists",$Switch4Exists);
			$query->bindparam(":Switch5Exists",$Switch5Exists);
			$query->bindparam(":Switch6Exists",$Switch6Exists);
			$query->execute();
						
			echo "1";
	}
	catch(PDOException $ex)
	{
		echo $ex->getMessage();
	}
?>