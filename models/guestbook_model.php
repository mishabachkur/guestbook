<?php
session_start();
Class GuestbookModel extends Model
{
	function Add($name, $shorttext, $fulltext)// Додавання в БД нового запису
	{
		$time=time();
		$n=$name;
		$s=$shorttext;
		$f=$fulltext;
		mysql_query ("insert into note (`name`,`shorttext`,`fulltext`,`timestamp`, `autor` ) values ('".GuestbookController::safe($n)."', '".GuestbookController::safe($s)."', '".GuestbookController::safe($f)."','".GuestbookController::safe($time)."','".GuestbookController::safe($_SESSION['naming'])."')");
		Header("Location:index.php");
	}
	function Update($id, $name, $shorttext, $fulltext)//Перезапис в БД існуючого запису
	{	
		$edittime=time();
		$n=$name;
		$s=$shorttext;
		$f=$fulltext;
		$result = mysql_query("update note set `name` = '".GuestbookController::safe($n)."', `shorttext` = '".GuestbookController::safe($s)."',`fulltext` = '".GuestbookController::safe($f)."', `date_update` = '".$edittime."' where id = ".GuestbookController::safe($id));
		Header("Location:index.php");
	}
	function Delete($id)//Видалення запису з БД
	{
		mysql_query("delete from  note where id = ".GuestbookController::safe($id));
		Header("Location:index.php");
	}
	function One($id)//Виклик у асоціативний масив одного посту
	{
		error_reporting(E_ALL);
		$note=mysql_query( "select `id`,`name`,`shorttext`,`fulltext`, `timestamp`, `date_update` from  note where id = ".GuestbookController::safe($id));
		// print_r($id);
		// die();
		$res = mysql_fetch_array($note);
		return $res;
	}
	function ShowAll()//Показа усіх існуючих постів за часом створення
	{
		 $allPosts = mysql_query("select * from note order by `timestamp` DESC ");
		    if(mysql_num_rows($allPosts) < 1) 
		    {
		        return NULL;
		    } 
		    else
		    {
		    	return $allPosts;
			}
	}

}
	
