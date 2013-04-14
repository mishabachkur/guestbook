<html>
<head>
<title>Відновлення пароля, крок 1!</title>
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
		<form id="form1" action="route.php?act=linkpw" method="POST">
			<fieldset>
							<p class="first">
								<label>E-mail: *</label>
								<input type="email" name="email" placeholder="Наприклад,  mishabachkur@gmail.com" required>
							</p>		
						</fieldset>	
						<p class="submit"><button type="submit">Відправити на e-mail!</button></p>
			
		</form>
	</article>
</body>
</html>