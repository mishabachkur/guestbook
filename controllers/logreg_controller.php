<?php
session_start();
Class LogregController
{
	public function Login()
	{
		GuestbookView::ViewLog();
	}
	public function LoadSite($email)
	{	
		
		LogregModel::LastComing($email);
		$_SESSION['lastcoming']=time();
		$_SESSION['email']=1;
		header('Location:index.php');
	}
	public function LogOut()
	{
		$_SESSION['email']=0;
		unset($_SESSION['email']);
		unset($_SESSION['lastcoming']);
		unset($_SESSION['time_reg']);
		unset($_SESSION['naming']);
		unset($_SESSION['email']);
		unset($_SESSION['id']);
		header('Location:index.php');
	}
	public function Loginout()
	{
		if (!$_SESSION['email'])
		LogregController::Login();
		else
		LogregController::LogOut();
	}
	public function Check($email, $password)
	{
			if (LogregModel::CheckUser($email, $password))
		{

		}
		else
		{
			echo "Неправильні логін чи пароль";
			LogregController::Login();
		}
	}
	public function Registration($name, $surname, $email, $password)
	{
		if ($name & $surname & $email & $password)
		{
				if(LogregModel::Valid($email))
				{
					echo "Такий користувач вже існує";
					LogregController::Login();
				}
				else
				{
					if (LogregModel::AddUser($name, $surname, $email, $password))
					{
						mail($email, "Вітаю!", "Ви зараєструвалися на гостьовій книзі!");
						header('Location:route.php?act=log_in');
					}
				}
		}
		else
		{
			echo "Не всі поля заповнені!";
			LogregController::Login();
		}
	}
	public function ForgetPW()
	{
		GuestbookView::LinkforPW();
	}
	public function LinkPW($email)
	{
		if ($email)
			if(LogregModel::Valid($email))
				{
					LogregModel::SavelinkforPW($email);
					header('Location:index.php');
				}
			else
			{
				echo "Такого користувача не існує!";
				GuestbookView::LinkforPW();
			}
		else
		{
			echo "Введіть імейл!";
			GuestbookView::LinkforPW();
		}


	}
	public function RestorePW($id)
	{
		GuestbookView::RestorePW();
		$_SESSION['idpw']=$id;
	}
	public function ChangePW($password1,$password2)
	{	
		if ($password1 & $password2)
		if ($password1===$password2)
		{
		LogregModel::ChangePW($password1);
		header('Location:route.php?act=log_in');
		}
		else 	
		{
			echo "Паролі не співпадають, спробуйте знову!";
			GuestbookView::RestorePW();
		}
		else
		{
			echo "Введіть пароль та його підтвердження!";
			GuestbookView::RestorePW();
		}
	}
}
