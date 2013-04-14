<?php
session_start();
//Клас, що слугує для відображення темпейтів на екрані користувача відповідно до його запитів
Class GuestbookView
{
	function Main() 
	{
		require_once 'views/layout/main.tpl';
	}

	function ViewForm($note)
	{
		if($note)
		{
			$Title='Редагування';
			$act='edit';
			$Choose='Редагувати';
			$id=$note['id'];
		}
		else
		{
			$Title='Додавання';
			$User=$_SESSION['naming'];
			$Choose='Публікувати';
			$act='add';
		}
		require_once 'views/guestbook/form.tpl';

	}
		function ViewView($note)
	{	
		if ($note['date_update'])
		{
			$dtemp='<!--Дата редагування:--> <img src="../images/icon/update.png">';
			$edittm=date('d-m-Y H:i:s', $note['date_update']);
		}
		else 
		{
			$dtemp=NULL;
			$edittm=NULL;
		}
		require_once 'views/guestbook/view.tpl';

	}
		function ViewList()
	{	
		$all = GuestbookModel::ShowAll();
		require_once 'views/guestbook/list.tpl';

	}
	public function ViewLog()
	{
		require_once 'views/logreg/reg.tpl';
	}
	public function ViewUserwindow()
	{
		require_once 'views/logreg/userwindows.tpl';
	}
	public function Error()
	{
		require_once 'views/errors/error.tpl';
	}
	public function LinkforPW()
	{
		require_once 'views/logreg/linkpw.tpl';
	}
	public function RestorePW()
	{
		require_once 'views/logreg/restorepw.tpl';
	}

}
