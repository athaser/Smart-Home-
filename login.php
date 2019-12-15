<?php
	require 'init.php';
    $Email=$_POST['email'];
	$Pass=$_POST['pass'];
try{
	//$Email = "vas";
	//$Pass = "12345";
	$sql = "SELECT * FROM user WHERE Email=:Email AND Pass=:Pass";
	$sth = $dbh->prepare($sql, array());
	$sth -> execute(array(':Email' => $Email , ':Pass' => $Pass));
	$log = $sth->fetchAll();
	
	if($sth->rowCount() == 1)
	{
		foreach ($log as $row )
		{
				echo '1///'.$row[0];					}	
		}
	}catch(Exception $e) {
    	echo "error on Testing email : ERROR CODE[1200] : ".$e ;   
	}
?>