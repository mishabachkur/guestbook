<?php
session_start();
Class LogregModel extends Model
{
public function Valid($email)
	{	
		$note=mysql_query( "select `email`, `password`, `name`, `surname` from  users");
		while ($res = mysql_fetch_array($note))
			if($res['email']===$email)
			{
				return $res;
				break;
			}	
	}

	public function AddUser($name, $surname, $email, $password)
	{
		$time=time();
		$n=$name;
		$s=$surname;
		$e=$email;
		$p=$password;
		$status="admin";
		$res = mysql_query ("insert into users (`name`,`surname`,`email`,`password`,`time_reg`, `status` ) values 
			('".GuestbookController::safe($n)."','".GuestbookController::safe($s)."', '".GuestbookController::safe($e)."', '".GuestbookController::safe($p)."','".GuestbookController::safe($time)."','".GuestbookController::safe($status)."')");

		return $res;
	}	
	public function CheckUser($email, $password)
	{
		if ($res=LogregModel::Valid($email))
		{
			if($password===$res['password'])
			{	
				LogregController::LoadSite($email);
				return 1;
			}
		}
	}
	public function LastComing($email)
	{

		$timing=time();
		$note=mysql_query( "select  `id`,`email`, `password`, `name`, `surname`, `time_reg` from  users");
		while ($res = mysql_fetch_array($note))
		if($res['email']===$email)
			{	
				$_SESSION['id']=$res['id'];
				$_SESSION['naming']=$email;
				$_SESSION['email']=$res['email'];
				$_SESSION['time_reg']=$res['time_reg'];
				$_SESSION['lastcoming']=$res['time_lcoming'];
				mysql_query("update users set `time_lcoming` = '".$timing."' where id =" .$res['id']);
				
			}
		
	}
	public function SavelinkforPW($email)
	{
		$time=time();
		srand();
		$temp=$email;
		$plus=rand(10,3000);
		$link = sha1($email.$plus);
		$note=mysql_query( "select  `id`,`email`, `password`, `name`, `surname`, `time_reg` from  users");
		while ($res = mysql_fetch_array($note))
		if($res['email']===$email)
				mysql_query("update users set `linkpw` = '".$link."', `linktiming` ='".$time."' where id =" .$res['id']);
		mail($email, "Відновлення пароля!", "Ви запросили відновити ваш пароль, для продовження перейдіть по посиланню: localhost/route.php?act=".$link);
	}
	public function ChangePW($password1)
	{
		$time=time();
		mysql_query("update users set `password` = '".$password1."' where id =" .$_SESSION['idpw']);
		mysql_query("update users set `linkpw` = '' where id =" .$_SESSION['idpw']);
		unset($_SESSION['idpw']);
	}
	public function TimeValidation($id)
	{
		$time=time();
		$note=mysql_query( "select `id`,`email`, `password`, `name`,`surname`, `linktiming` from  users");
		while ($res = mysql_fetch_array($note))
			if($res['id']===$id)
				if ($time-$res['linktiming']<3600)
					return 1;
				else 
				return 0;
	}
}
