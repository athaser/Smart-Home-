<?php
	require 'init.php';
    //$userid=$_POST['id'];
try{
	$id = "1";
	$sql = "SELECT * FROM rooms WHERE id=:id";
	$sth = $dbh->prepare($sql, array());
	$sth -> execute(array(':id' => $id));
	//$room = $sth->fetchAll();
	
	//if(sizeof($room)>0)
	//{
		$rooms = array();
		$allRooms =array();
		
		while($row = $sth->fetch(PDO::FETCH_ASSOC)){
			
			$roomID = $row['RoomId'];
			$roomName = $row['RoomName'];
			$roomType = $row['RoomType'];
			$TemperatureExists = $row['TemperatureExists'];
			$HumidityExists= $row['HumidityExists'];
			$LuminocityExists= $row['LuminocityExists'];
			$Temperature= $row['Temperature'];
			$Humidity= $row['Humidity'];
			$Luminocity= $row['Luminocity'];
			$Switch1Exists= $row['Switch1Exists'];
			$Switch1= $row['Switch1'];
			$Switch2Exists= $row['Switch2Exists'];
			$Switch2= $row['Switch2'];
			$Switch3Exists= $row['Switch3Exists'];
			$Switch3= $row['Switch3'];
			$Switch4Exists= $row['Switch4Exists'];
			$Switch4= $row['Switch4'];
			$Switch5Exists= $row['Switch5Exists'];
			$Switch5= $row['Switch5'];
			$Switch6Exists= $row['Switch6Exists'];
			$Switch6= $row['Switch6'];
			
			
			
			array_push($rooms,$roomID);
			array_push($rooms,$roomName);
			array_push($rooms,$roomType);
			array_push($rooms,$TemperatureExists);
			array_push($rooms,$HumidityExists);
			array_push($rooms,$LuminocityExists);
			array_push($rooms,$Temperature);
			array_push($rooms,$Humidity);
			array_push($rooms,$Luminocity);
			array_push($rooms,$Switch1Exists);
			array_push($rooms,$Switch2Exists);
			array_push($rooms,$Switch3Exists);
			array_push($rooms,$Switch4Exists);
			array_push($rooms,$Switch5Exists);
			array_push($rooms,$Switch6Exists);
			array_push($rooms,$Switch1);
			array_push($rooms,$Switch2);
			array_push($rooms,$Switch3);
			array_push($rooms,$Switch4);
			array_push($rooms,$Switch5);
			array_push($rooms,$Switch6);
			
			array_push($allRooms,$rooms);
			
			unset($rooms);
			$rooms = array();
			
		//}
		
		
	}
	$json['rooms'] = $allRooms;
		echo json_encode($json);
}
catch(Exception $e){
    	echo "error on Testing email : ERROR CODE[1200] : ".$e ;   
}
?>