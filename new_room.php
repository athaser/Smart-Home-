<?php 

require 'init.php';
$json=file_get_contents("php://input");
#$json ='{"userid":1,"roomname":"abc","roomtypeid":2,"sensorids":[6,8,4,7,5,2,3]}';

$obj=json_decode($json,TRUE);
$userid=$obj["userid"];
$roomname=$obj["roomname"];
$roomtypeid=$obj["roomtypeid"];
$sensorids=array();
$sensorids=$obj["sensorids"];





		
		
		try
	{
		$query=$dbh -> prepare("INSERT INTO `rooms` (`RoomId`, `RoomName`, `RoomType`, `UserId`) VALUES (NULL, :roomname, :roomtypeid, :userid)");
			
			
			$query->bindparam(":roomname",$roomname);
			$query->bindparam(":roomtypeid",$roomtypeid);
			$query->bindparam(":userid",$userid);
			$query->execute();
			$roomid_new=$dbh->lastInsertId ();
					

			//echo "the id created is ".$roomid_new;
			foreach ($sensorids as $row )
		{
			$query=$dbh -> prepare("INSERT INTO `sensors` (`SensorId`,  `SensorType`,  `RoomId`) VALUES (NULL,  :sensortypeid, :roomid_new)");
			$query->bindparam(":sensortypeid",$row);
			$query->bindparam(":roomid_new",$roomid_new);
			$query->execute();
			$sensorid_new=$dbh->lastInsertId ();
				
				//echo $sensorid_new;
		}
		
		echo "Room Creation was successful";
			
	}
	catch(PDOException $ex)
	{
		echo $ex->getMessage();
	}
?>

