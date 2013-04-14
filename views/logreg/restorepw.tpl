<html>
<head>
	<title>Відновлення пароля, крок 2!</title>
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
<form id="form1" action="route.php?act=restore" method="POST">
	<fieldset>
							<p class="first">
								<label>Встановіть новий пароль: *</label>
								<input type="password" name="password1" placeholder="Наприклад,  admin1" required>
							</p>
							<p class="first">
								<label>Підтвердіть новий пароль: *</label>
								<input type="password" name="password2" placeholder="Наприклад,  admin1" required>
							</p>		
						</fieldset>	
	Встановіть новий пароль: <br> <input type="password" name="password1"><br>
	Підтвердіть новий пароль <br> <input type="password" name="password2"><br>
	<p class="submit"><button type="submit">Змінити</button></p>
</form>
</article>
</body>
</html>