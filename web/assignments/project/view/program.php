<?php
session_start();

if (!isset($_SESSION['valid_user'])) {
    $action = 'login';
    header('Location:../index.php');
    exit;
}
require ('../model/database.php');
require ('../model/functions.php');

if (isset($_GET['idSchool'])) {
    $idSchool = $_GET['idSchool'];
}
if (isset($_GET['idCenter'])) {
    $idCenter = $_GET['idCenter'];
}

$programs = getPrograms($idCenter);
$center = getCenter($idCenter);
?>
<!doctype html>
<html lang="en">
    <head>
        <title><?php echo $_SESSION['username'] ?> | Project Grupo IDIOMAS</title>
        <?php include "../modules/header.php"; ?>
    </head>
    <body>
        <?php include "../modules/nav.php"; ?>
        <main>
            <div class="container-fluid">
                <img class="" src="" title="">
                <h1 class="pb-3"><?php echo $center['center'] ?> <a href="../view/center.php?idSchool=<?php echo $idSchool ?>"><button class="btn btn-outline-danger">Back</button></a></h1>
                <p><img src="../images/icon-address.png"> <?php echo $center['address'] ?><br>
                    <img src="../images/icon-globe.png"> <?php echo $center['city'] ?> - <?php echo $center['country'] ?><br>
                    <img src="../images/icon-phone.png"> <?php echo $center['phone'] ?><br>
                    <img src="../images/icon-email.png"> <a href="mailto:<?php echo $center['email'] ?>"><?php echo $center['email'] ?></a></p>
                <h2>Programs</h2>
                <?php
                if ($message != "") {
                    echo $message;
                }
                ?>
                <table class="table">
                    <tr>
                        <th>Program</th>
                        <th>Description</th>
                        <th>Language</th>
                        <th>Currency</th>
                        <th class="text-right">Cost</th>
                        <th class="text-right">Weeks</th>
                        <th class="text-right">Lessons</th>
                    </tr>
                    <?php foreach ($programs as $p): ?>
                        <input type="hidden" name="idCenter" value="<?php echo $p['id'] ?>">
                        <tr>
                            <td><?php echo $p['program'] ?></td>
                            <td><?php echo $p['description'] ?></td>
                            <td><?php echo $p['language'] ?></td>
                            <td><?php echo $p['currency'] ?></td>
                            <td class="text-right">$<?php echo $p['cost'] ?></td>
                            <td class="text-right"><?php echo $p['weeks'] ?></td>
                            <td class="text-right"><?php echo $p['lessons'] ?></td>
                        </tr>

                    <?php endforeach; ?>
                </table>
            </div>
        </main>
        <?php include "../modules/footer.php" ?>
    </body>
</html>
