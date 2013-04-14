<?php
session_start();
//Темплейт лейаута, тобто той, котрий використовується першочергово при завантаженні
?>
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
		
		<!-- вивід записів -->
				<div class="mypost">
				<p style="text-align: center; "><h1><img src="../images/icon/post.png"> Мої Записи:</h1></p>
				</div>		
		<!-- кінець виводу записів -->
			
			

			


		</body>
</hmtl>	