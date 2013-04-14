<?php
//Темплейт для створення нового чи редактування вже існуючого запису
?>
<html>
	<head>
		<title><?echo $Title ?></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
		<h3><?echo $Title ?></h3>
		<form id="form1" action="route.php?act=<?echo $act?>&id=<?echo $id?>" method="POST">
			<fieldset>
						<p class="first">
							<label>Назва *</label>
							<input type="text" name="name" value=<?echo $note['name']?>>
						</p>
							<p>
								<label>Короткий текст *</label>
								<textarea name="shorttext" rows="3" cols="40"><?echo $note['shorttext']?></textarea>
							</p>
							<p>
								<label>Повний текст *</label>
								<textarea name="fulltext" rows="10" cols="40"><?echo $note['fulltext']?></textarea>
							</p>			
					</fieldset>	
			<p class="submit"><button type="submit"><?php echo $Choose?></button>
						<button type="button" onClick="history.go(-1);">Назад</button></p>							
				</form>	
		
		</form>
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