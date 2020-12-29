<?php
	require 'init.php';
	//$myStr=$_POST['myStr'];
	$myStr="1///1///roomname///1///false///true///false///true///false///false///true///false///";

	$pieces = explode("///", $myStr);
	$RoomId=$pieces[0]; 
	$id=$pieces[1]; 
	$RoomName=$pieces[2];
	$RoomType=$pieces[3]; 
	$TemperatureExists= $pieces[4]; 
	$HumidityExists=$pieces[5]; 
	$LuminocityExists=$pieces[6]; 
	$Switch1Exists=$pieces[7]; 
	$Switch2Exists=$pieces[8]; 
	$Switch3Exists=$pieces[9]; 
	$Switch4Exists=$pieces[10]; 
	$Switch5Exists=$pieces[11]; 
	$Switch6Exists=$pieces[12]; 

	try
	{
			
								
			$query=$dbh -> prepare("UPDATE `rooms` SET `RoomName`=:RoomName,`RoomType`=:RoomType,
			`id`=:id,`TemperatureExists`=:TemperatureExists,`HumidityExists`=:HumidityExists,`LuminocityExists`=:LuminocityExists,
			`Switch1Exists`=:Switch1Exists,`Switch2Exists`=:Switch2Exists,`Switch3Exists`=:Switch3Exists,`Switch4Exists`=:Switch4Exists,
			`Switch5Exists`=:Switch5Exists,`Switch6Exists`=:Switch6Exists WHERE `RoomId`=:RoomId");
			
			$query->bindparam(":RoomId",$RoomId);
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
			
			echo 1;
	}
	catch(PDOException $ex)
	{
		$ex->getMessage();
	}
?>