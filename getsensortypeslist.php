<?php
	require 'init.php';
    //$userid=$_POST['id'];
try{
	$id = "1";
	$sql = "SELECT sensortypeid,sensor_name FROM sensortypes  ";
	$sth = $dbh->prepare($sql);
	$sth -> execute(array());
	//$room = $sth->fetchAll();
	
	
		$sensortype = array();
		$alltypes =array();
		
		while($row = $sth->fetch(PDO::FETCH_ASSOC)){
			
			$sensortypeid = $row['sensortypeid'];
			$sensor_name = $row['sensor_name'];
			
			
			array_push($sensortype,$sensortypeid);
			array_push($sensortype,$sensor_name);
			
			
			array_push($alltypes,$sensortype);
			
			unset($sensortype);
			$sensortype = array();
		
		
		
	}
	$json['sensortypes'] = $alltypes;
		echo json_encode($json);
}
catch(Exception $e){
    	echo "error : ERROR CODE[1200] : ".$e ;   
}
?>