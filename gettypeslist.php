<?php
	require 'init.php';
    //$userid=$_POST['id'];
try{
	
	$sql = "SELECT * FROM roomtypes  ";
	$sth = $dbh->prepare($sql);
	$sth -> execute(array());
	//$room = $sth->fetchAll();
	
	
		$roomtype = array();
		$alltypes =array();
		
		while($row = $sth->fetch(PDO::FETCH_ASSOC)){
			
			$roomtypeid = $row['roomtypeid'];
			$type = $row['roomtype'];
			
			
			array_push($roomtype,$roomtypeid);
			array_push($roomtype,$type);
			
			
			array_push($alltypes,$roomtype);
			
			unset($roomtype);
			$roomtype = array();
		
		
		
	}
	$json['roomtypes'] = $alltypes;
		echo json_encode($json);
}
catch(Exception $e){
    	echo "error on Testing email : ERROR CODE[1200] : ".$e ;   
}
?>