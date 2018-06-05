<?php
session_start();
//require ('../model/dbconnect.php');
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
        <hr>
        <div class="container-fluid">
            <a href="addCenter.php?idSchool=<?php echo $idSchool ?>"><button class="btn btn-success" type="button" id="addCenter" name="addCenter">Add Center</button></a>
        </div>
        <pre class="container-fluid">
            <?php echo $info ?>
        </pre>
        <?php include "../modules/footer.php" ?>
    </body>
</html>
