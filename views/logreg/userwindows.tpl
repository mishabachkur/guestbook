<?php
session_start();
?>
<? if ($_SESSION['email'])
{?>
<html>
<head>
		<title>Гостьова книга</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	</head>
	<div id="userwindows">
	
	<h4 align=right> Привіт, <img src="../images/icon/author.png"> <?php echo $_SESSION['naming'];?> !</h4>
	<h4 align=right>Дата створення акаунта:<img src="../images/icon/date.png"> : <?php echo date('d-m-Y H:i:s', $_SESSION['time_reg'])?></h4>
	<h4 align=right>Останній раз ви були на сайті <img src="../images/icon/date.png"> : <?php echo date('d-m-Y H:i:s', $_SESSION['lastcoming'])?></h4>
	</div>
	<?
}
else 
{?>
	<div id="userwindows">
	<h3 align=right>Віконце користувача</h3>
	<h4 align=right>Ви не залогінені!</h4>
	</div>
<?}?>

</html>
