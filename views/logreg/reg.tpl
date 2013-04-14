<html>
	<head>
		<title>Гостьова книга</title>
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
		<h2>Залогіньтесь</h2>
		<form id="form1" action="route.php?act=login" method="POST">
			<fieldset>
							<p class="first">
								<label>Логін *</label>
								<input type="text" name="email" placeholder="Наприклад,  mishabachkur@gmail.com" required>
							</p>
							<p>
									<label>Пароль *</label>
									<input type="password" name="password" placeholder="Наприклад,  admin" required>
								</p><a href=route.php?act=forget><strong>Забули пароль ?</strong></a>			
						</fieldset>	
			<p class="submit"><button type="submit">Відправити</button></p>
			
		</form>

		<h2>або пройдіть реєстрацію</h2>
		<form id="form1" action="route.php?act=reg" method="POST">
			<fieldset>
							<p class="first">
								<label>Введіть Ім'я *</label>
								<input type="text" name="name" placeholder="Наприклад,  Михайло" required>
							</p>
							<p>
									<label>Введіть Прізвище *</label>
									 <input type="text" name="surname" placeholder="Наприклад, Бачкур" required>
								</p>
								<p>
									<label>Введіть email *</label>
									 <input type="email" name="email" placeholder="Наприклад, mishabachkur@gmail.com" required>
								</p>
								<p>
									<label>Введіть пароль *</label>
									<input type="password" name="password" placeholder="Наприклад, admin" required>
								</p>			
						</fieldset>	
			<p class="submit"><button type="submit">Відправити</button></p>	
		</form>
	</article>