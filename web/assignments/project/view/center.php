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

$centers = getCenters($idSchool);
$school = getSchool($idSchool);

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
                <h1 class="pb-3"><?php echo $school['school'] ?> <a href="../index.php"><button class="btn btn-outline-danger">Back</button></a></h1>
                <p><img src="../images/icon-email.png"> <a href="mailto:<?php echo $school['email'] ?>"><?php echo $school['email'] ?></a><br>
                    <img src="../images/icon-web.png"> <a href="http://<?php echo $school['website'] ?>" target="_blank"><?php echo $school['website'] ?></a></p>
                <div class="row float-right mr-2">
                    <a href="addCenter.php?idSchool=<?php echo $idSchool ?>"><button class="btn btn-primary" type="button" id="addCenter" name="addCenter">Add Center</button></a>
                </div>
                <h2>Select a Center</h2>
                <?php
                if ($message != "") {
                    echo $message;
                }
                ?>
                <table class="table">
                    <tr>
                        <td>  
                            <?php foreach ($centers as $c): ?>
                                <form id="form<?php echo $c['center'] ?>" method="get" action="program.php">
                                    <input type="hidden" name="idSchool" value="<?php echo $idSchool ?>">
                                    <input type="hidden" name="idCenter" value="<?php echo $c['id'] ?>">
                                    <button value="<?php echo $c['center'] ?>" type="submit" class="btn btn-light"><?php echo $c['country'] ?> – <?php echo $c['center'] ?></button>
                                </form>
                                <hr>
                            <?php endforeach; ?>
                        </td>
                        <td>
                            <?php foreach ($centers as $c): ?>
                                <form id="form<?php echo $c['center'] ?>" method="get" action="editCenter.php">
                                    <input type="hidden" name="idSchool" value="<?php echo $idSchool ?>">
                                    <input type="hidden" name="idCenter" value="<?php echo $c['id'] ?>">
                                    <a href="editCenter.php?idSchool=<?php echo $idSchool ?>&idCenter=<?php echo $idCenter ?>"><button class="btn btn-outline-secondary">Edit</button></a>
                                </form>
                                <hr>
                            <?php endforeach; ?>
                        </td>
                    </tr>
                </table>
            </div>
        </main>
        <?php include "../modules/footer.php" ?>
    </body>
</html>
