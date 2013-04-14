<?php if (!$all) //Темплейт для повного списку існуючих постів і відповідне розгалуження для перевірки чи існують взагалі записи
{
	echo "Жодного запису";
} else

  	while($note = mysql_fetch_assoc($all)) 
        { 
        	if ($note['date_update'])
        	{
        		$reg='<!--Дата редагування --> <img src="../images/icon/update.png">';
        		$edittm=date('d-m-Y H:i:s', $note['date_update']);

        	}
        	else 
        	{
        		$reg=NULL;
        		$edittm=NULL;
        	}

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
<article>
				<?php
				if ($_SESSION['email'])
				{ ?>
				<p><!--<b>Назва: </b>--><span><a href="route.php?act=showone&id=<?echo $note['id']?>"><?echo $note['name']?></a></span></p>
				<p><!--<b>Короткий текст: </b>--><?echo $note['shorttext']?></p>
				<!--<p><b>Повний текст: </b><?echo $note['fulltext']?></p>-->
				 
				<p>
					<!--<b>Дата створення: </b>--><img src="../images/icon/date.png"> <?echo date('d-m-Y H:i:s', $note['timestamp'])?> &nbsp
				<?echo $reg?> <?echo $edittm?> &nbsp <!--<b>Автор: </b>--><img src="../images/icon/author.png"> <?echo $note['autor']?></p>
				<div style="float:right;">
				<a href="route.php?act=delete&id=<?echo $note['id']?>"><img src="../images/icon/trash.png"></a>
				<a href="route.php?act=editnew&id=<?echo $note['id']?>"><img src="../images/icon/edit.png"></a>
			<!--	<a href="route.php?act=showone&id=<?echo $note['id']?>"><img src="../images/icon/readmore.png"></a>-->
				</div>
				<?php }
				else 
				{?>
				<p><!--<b>Назва: </b>--><span><a href="route.php?act=showone&id=<?echo $note['id']?>"><?echo $note['name']?></a></span></p>
				<p><!--<b>Короткий текст: </b>--><?echo $note['shorttext']?></p>
			<!--	<p><b>Повний текст: </b><?echo $note['fulltext']?></p>-->
				<p><!--<b>Дата створення: </b>--><img src="../images/icon/date.png"> <?echo date('d-m-Y H:i:s', $note['timestamp'])?>&nbsp
				 <?echo $reg?> <?echo $edittm?> &nbsp <!--<b>Автор: </b>--><img src="../images/icon/author.png"> <?echo $note['autor']?></p>
			<!--	<div style="float:right;">
				<a href="route.php?act=showone&id=<?echo $note['id']?>"><img src="../images/icon/readmore.png"></a>
			</div>-->
				<?php }
				?>
</article>
<div style="margin-top: 10px; "></div>
			</body>



</html><?php }?>