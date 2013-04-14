<?php
session_start();
//Темлейт для відображення одного посту 
?>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css" href="../../css/style.css">
		<link rel="stylesheet" type="text/css" href="../../css/menu.css">
		<script src="../../js/jquery.min.js"></script>
		<script src="../../js/login.js"></script>
	</head>
	<body>
		<!-- авторизація та вивід кнопки залишити запис-->
				<header class="cf">
					<form action="route.php?act=log_in" method="POST">
				<?php
				if (!$_SESSION['email']) 
					$temp="Залогінитись або пройти реєстрацію";
				else
					$temp="Вилогінитись";
				?>
				<a href="../index.php">Головна</a>
				<input id="enter" type="submit" value="<?php echo $temp ?>">
			</form>
			<form action="route.php?act=addnew" method="POST">
					<button type="submit">Додати запис</button>
			</form>
		</header><br>
		<!-- кінець авторизація та вивід кнопки залишити запис -->
		<article>
		<p><!--<b>Назва: </b>--><span><?echo $note['name']?></span></p>
		<!--<p><b>Короткий текст: </b><?echo $note['shorttext']?></p>-->
		<p><!--<b>Повний текст: </b>--><?echo $note['fulltext']?></p>
		<p><!--<b>Дата створення: </b>--><img src="../images/icon/date.png"> <?echo date('d-m-Y H:i:s', $note['timestamp'])?>&nbsp
		 <?echo $dtemp?> <?echo $edittm ?></p>
		 <button type="button" onClick="history.go(-1);">Назад</button>
	</article>
		<!-- футер -->
		<footer>
				        <p style="text-align: center;">Створено:<a target="_blanc" href="http://vk.com/misha_bachkur">Бачкур Михайло</a> 
				        </p>
				        <p style="text-align: center;">
						<a target="_blanc" href="http://vk.com/misha_bachkur"><img src="../images/icon/vk.png"></a> - Вконтакте |
						<a target="_blanc" href="http://www.facebook.com/profile.php?id=100001952246103&ref=tn_tnmn"><img src="../images/icon/facebook.png"></a> - Facebook |
						<a target="_blanc" href="mailto:mishabachkur@gmail.com"><img src="../images/icon/gmail.png"></a> - Gmail
						</p>

					</footer>
	</body>
</html>