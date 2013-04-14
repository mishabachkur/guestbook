<?php //Файл з підключенням усіх необхідних файлів і запуском початкового вікна інтерфейсу
header('Content-type: text/html; charset=utf-8');
require_once 'View.php';
require_once 'config/Config.php';
require_once 'Model.php';
require_once 'Controller.php';
require_once 'models/guestbook_model.php';
require_once 'controllers/guestbook_controller.php';
GuestbookView::Main();
GuestbookView::ViewList();
GuestbookView::ViewUserwindow();

