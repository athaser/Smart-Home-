<?php
	require 'init.php';
    $roomid=$_GET['roomid'];
try{
	//$id = "1";
	
	$sql = "select * from (SELECT sensortypes.sensor_name,sensors.sensorid,is_actuator,value,
case when sensors.SensorId is null then 0 else 1 end as exists_,img_name   FROM sensortypes
left join sensors
 on sensors.SensorType=sensortypes.sensortypeid
 and sensors.roomid=:roomid)dataa
 where case when exists_*is_actuator=1 then 1 
 			when is_actuator=0 then 1 else 0 end=1";
		$sth = $dbh->prepare($sql, array());
	$sth -> execute(array(':roomid' => $roomid));
	//$room = $sth->fetchAll();
	
	
		$sensors = array();
		$allsensors =array();
		
		while($row = $sth->fetch(PDO::FETCH_ASSOC)){
			
			$sensor_name = $row['sensor_name'];
			$sensorid = $row['sensorid'];
			$is_actuator = $row['is_actuator'];
			$value = $row['value'];
			$exists_ = $row['exists_'];
			$img_name=$row['img_name'];
			
			array_push($sensors,$sensor_name);
			array_push($sensors,$sensorid);
			array_push($sensors,$is_actuator);
			array_push($sensors,$value);
			array_push($sensors,$exists_);
			array_push($sensors,$img_name);
			
			
			
			array_push($allsensors,$sensors);
			
			unset($sensors);
			$sensors = array();
		
		
		
	}
	$json['sensors'] = $allsensors;
		echo json_encode($json);
}
catch(Exception $e){
    	echo "error : ERROR CODE[1200] : ".$e ;   
}
?>


