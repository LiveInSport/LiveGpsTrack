<?php
/*
 * Written By: ShivalWolf
 * Date: 2011/06/03
 * Contact: Shivalwolf@domwolf.net
 *
 * UPDATE 2011/04/05
 * The code now returns a real error message on a bad query with the mysql error number and its error message
 * checks for magic_quotes being enabled and strips slashes if it is. Its best to disable magic quotes still.
 * Checks to make sure the submitted form is a x-www-form-urlencode just so people dont screw with a browser access or atleast try to
 * Forces the output filename to be JSON to conform with standards
 *
 * UPDATE 2011/06/03
 * Code updated to use the Web Module instead of tinywebdb
 *
 * UPDATE 2013/12/26 and 2014/02/18
 * minor modifications by Taifun, puravidaapps.com
 *
 * UPDATE 2014/07/11
 * mysql API (deprecated) replaced by mysqli by Taifun
 *
 * UPDATE 2015/04/30
 * SELECT logic adjusted (result stored in temp. file removed) by Taifun
 *
 * UPDATE 2016/02/21
 * Bugfix Undefined variable: csv
 */

/************************************CONFIG****************************************/
//DATABSE DETAILS//
$serverName="den1.mssql2.gear.host";
$uid = "liv";
$pwd="LiveInSport!";
$db="liv";
$connectionInfo=array("UID"=>"liv", "PWD"=>"LiveInSport!", "Database"=>"liv");

//SETTINGS//
//This code is something you set in the APP so random people cant use it.
$SQLKEY="secret";
$handle = mssql_connect($serverName, $uid, $pwd) or die("Cannot connect to server");
$sdb= mssql_select_db($dn, $handle) or die("Cannot SELECT Database");
$query="SELECT * FROM tracks";
$result=mssql_query($query);

while($row=mssql_fetch_array($result)){
	echo $row["id"];
}
/************************************CONFIG****************************************/
?>