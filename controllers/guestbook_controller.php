<?php
Class GuestbookController extends Controller
{
 function safe($tempF)//Функція для спецсимволів;
      {
          return mysql_real_escape_string($tempF);
      }
  function AddPost()//Функція для додавання нового запису(викликає з в'ю відповідну функцію)
  {
      if ($_SESSION['email'])
  		GuestbookView::ViewForm(NULL);
      else 
      GuestbookView::Error();
  }
  function DeletePost($id)//Функція для видалення
  {
      if ($_SESSION['email'])
      {
  		GuestbookModel::Delete($id);
      }
      else 
      GuestbookView::Error();
  }
  function ViewOne($id)//Функція для додавання відображення запису з використанням id
  {
  		$note=GuestbookModel::One($id);
  		GuestbookView::ViewView($note);
  }
  function EditPost($id)//Функція для редагування запису(викликає з модел та в'ю відповідні функції)
  {		
      if ($_SESSION['email'])
      {
  		$tb=GuestbookModel::One($id);
  		GuestbookView::ViewForm($tb);
      }
      else GuestbookView::Error();
  }
  public function EditPostDB($id, $name, $shorttext, $fulltext)
  {
    if ($_SESSION['email'])
      if($name & $shorttext & $fulltext)
        GuestbookModel::Update($id, $name, $shorttext, $fulltext);
        else 
          {
            echo "<div style='background-color:#EEE8AA;>";
            echo "Не всі поля заповнено!";
            echo "</div>";
            GuestbookController::EditPost($id);
          }
      else 
        GuestbookView::Error();
  }
  public function AddPostDB($name, $shorttext, $fulltext)
  {
    if($_SESSION['email'])
      if ($name & $shorttext & $fulltext)
        GuestbookModel::Add($name, $shorttext, $fulltext);
        else
        {
        echo "<div style='background-color:#EEE8AA;'>";
        echo "Не всі поля заповнено!";
        echo "</div>";
        GuestbookController::EditPost($name, $shorttext, $fulltext);
        }
      else 
        {
          GuestbookView::Error();
          LogregController::Login();
        }
  }
}
