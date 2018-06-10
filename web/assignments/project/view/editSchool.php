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
                <h2>Edit</h2>
                <?php
                if ($message != "") {
                    echo $message;
                }
                ?>
                <form action="../index.php" method="post">
                    <input type="hidden" name="action" value="editSchool">
                    <div class="form-group">
                        <input type="hidden" name="idSchool" value="<?php echo $school['id'] ?>">
                        <label for="school">School</label>
                        <input class="form-control" type="text" id="school" name="school" value="<?php echo $school['school'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input class="form-control" type="text" id="email" name="email" value="<?php echo $school['email'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input class="form-control" type="text" id="website" name="website" value="<?php echo $school['website'] ?>">
                    </div>
                    <input class="btn btn-success" type="submit" value="Save">
                </form>
            </div>
        </main>
        <hr>
        <pre class="container-fluid">
            <?php echo $info ?>
        </pre>
        <?php include "../modules/footer.php" ?>
    </body>
</html>
