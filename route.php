<?php
//Рут визначає подальші дії програми, відносно яких виконуються ті чи інші дії
require_once 'View.php';
require_once 'config/Config.php';
require_once 'Model.php';
require_once 'models/guestbook_model.php';
require_once 'Controller.php';
require_once 'controllers/guestbook_controller.php';
require_once 'models/logreg_model.php';
require_once 'controllers/logreg_controller.php';
$act=$_GET['act'];
$id=$_GET['id'];
extract($_POST);
	if ($act==="add") // Типу додавання в БД
		GuestbookController::AddPostDB($name, $shorttext, $fulltext);
	if ($act==="delete") //Видалення з БД
		GuestbookController::DeletePost($id);
	if ($act === "editnew")//Вивід форми з відповідними даними редагування
			GuestbookController::EditPost($id);
	if ($act==="edit")//Оновлення в БД
		GuestbookController::EditPostDB($id, $name, $shorttext, $fulltext);
	if($act==="showone")//Показ одного посту
			GuestbookController::ViewOne($id);
	if ($act==="addnew")//Вивід форми заповнення(порожньої)
		GuestbookController::AddPost(NULL); 
	if ($act==="log_in")
		LogregController::Loginout();
	if ($act==="login")	
		LogregController::Check($email, $password);
	if ($act==="reg")
		LogregController::Registration($name, $surname, $email, $password);
	if ($act==="forget")
		LogregController::ForgetPW();
	if ($act==="linkpw")
		LogregController::LinkPW($email);
	if ($act==="restore")
		LogregController::ChangePW($password1,$password2);
	else 
		{
		$note=mysql_query( "select  `id`,`email`, `password`, `name`, `surname`, `time_reg`, `linkpw` from  users");
		while ($res = mysql_fetch_array($note))
		if($act===$res['linkpw'])
			if (LogregModel::TimeValidation($res['id']))
		LogregController::RestorePW($res['id']);
		}
