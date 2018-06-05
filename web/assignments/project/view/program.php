<?php
session_start();
//require ('../model/dbconnect.php');
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
        <hr>
        <pre class="container-fluid">
            <?php echo $info ?>
        </pre>
        <?php include "../modules/footer.php" ?>
    </body>
</html>
