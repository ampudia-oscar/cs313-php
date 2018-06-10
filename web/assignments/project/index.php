<?php

session_start();
//session_unset();
//session_destroy();

require_once('model/database.php');
require_once('model/functions.php');


if (isset($_POST['action'])) {
    $action = $_POST['action'];
} else if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = 'go_to_app';
}

if (!isset($_SESSION['valid_user'])) {
    $action = 'login';
}

$idSchool = $_POST['idSchool'];

switch ($action) {
    case 'login':
        $username = $_POST['username'];
        $password = $_POST['password'];
        if (is_valid_admin_login($username, $password)) {
            $_SESSION['valid_user'] = true;
            $_SESSION['username'] = $_POST['username'];
            $_SESSION['id'] = userID($_SESSION['username']);
            $content = 'view/menu.php';

            $schools = getSchools();
            include 'home.php';
        } elseif (isset($username) || isset($password)) {
            $message = '<span style="color:red">Username or Password incorrect.</span>';
            include('view/login.php');
        } else {
            $message = 'You must login to continue.';
            include('view/login.php');
        }
        break;

    case 'go_to_app':
        $content = 'view/menu.php';
        $schools = getSchools();
        include 'home.php';
        break;

    case 'addSchool':
        $school = $_POST['schoolName'];
        $email = $_POST['schoolEmail'];
        $website = $_POST['schoolWebsite'];

        addSchool($school, $email, $website);

        $schools = getSchools();
        $content = 'view/success.php';
        include 'home.php';
        break;

    case 'addCenter':
        $center = $_POST['centerName'];
        $address = $_POST['centerAddress'];
        $email = $_POST['centerEmail'];
        $phone = $_POST['centerPhone'];
        $city = $_POST['centerCity'];
        $country = $_POST['centerCountry'];
        $idSchool = $_POST['idSchool'];

        addCenter($center, $address, $email, $phone, $city, $country, $idSchool);

        $content = 'view/success.php';
        include 'home.php';
        break;
    
    case 'gotoPrograms':
        if (isset($_POST['gotoPrograms'])){
            $content = 'view/programs.php';
            include 'home.php';
        } elseif (isset($_POST['editCenter'])) {
            $content = 'view/editCenter.php?idSchool='.$idSchool.'&idCenter='.$idCenter;
            include 'home.php';
        }
        break;

    case 'editSchool':
        $idSchool = $_POST['idSchool'];
        $school = $_POST['school'];
        $email = $_POST['email'];
        $website = $_POST['website'];
        
        editSchool($idSchool, $school, $email, $website);
        
        $content = 'view/success.php';
        include 'home.php';
        break;

    case 'editCenter':
        $idCenter = $_POST['idCenter'];
        $center = $_POST['center'];
        $address = $_POST['address'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        $city = $_POST['city'];
        $country = $_POST['country'];
        $idSchool = $_POST['idSchool'];

        editCenter($idCenter, $center, $address, $email, $phone, $city, $country);
        
        $content = 'view/success.php';
        include 'home.php';
        break;

    case 'logout':
        $_SESSION = array();
        session_destroy();
        session_unset();
        include $_SERVER['DOCUMENT_ROOT'] . '/assignments/project/view/login.php';
        break;
}

