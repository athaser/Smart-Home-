<?php 

require 'init.php';
$json=file_get_contents("php://input");
#$json ='{"roomid":"3"}';

$obj=json_decode($json,TRUE);
$roomid=$obj["roomid"];




		
		
		try
	{
		

		 $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$sql="Delete from rooms where Roomid=:roomid";
			
			$sth = $dbh->prepare($sql, array());
	$sth -> execute(array(':roomid' => $roomid));
			
					$row_count=$sth->rowCount();
				
			//echo "the id created is ".$roomid_new;
			
		if($row_count>0)
		{
		echo "Room Successfully Deleted";
		}
		else
		{
			echo "Room Does not exist";
			
		}
			
	}
	catch(PDOException $ex)
	{
		echo $ex->getMessage();
	}
?>

