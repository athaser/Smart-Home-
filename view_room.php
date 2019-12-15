<?php
	require 'init.php';
    $Userid=$_GET['userid'];
try{
	//$Userid = "1";
	$sql = "SELECT RoomId,RoomName, roomtypes.RoomType FROM rooms inner join roomtypes on roomtypes.roomtypeid=rooms.roomtype WHERE UserId=:Userid";
		$sth = $dbh->prepare($sql, array());
	$sth -> execute(array(':Userid' => $Userid));
	
	
	//$room_result=$sth->fetchAll();
	
		$rooms = array();
		$allRooms =array();
		
		while($row = $sth->fetch(PDO::FETCH_ASSOC)){
			
			$roomID = $row['RoomId'];
			$roomName = $row['RoomName'];
			$roomType = $row['RoomType'];
			
			
			
			
			array_push($rooms,$roomID);
			array_push($rooms,$roomName);
			array_push($rooms,$roomType);
			
			array_push($allRooms,$rooms);
			
			unset($rooms);
			$rooms = array();
			
		
		
		
	}
	$json['rooms'] = $allRooms;
		echo json_encode($json);
}
catch(Exception $e){
    	echo "error on Testing email : ERROR CODE[1200] : ".$e ;   
}
?>