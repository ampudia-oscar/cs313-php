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
                <h2>Edit</h2>
                <?php
                if ($message != "") {
                    echo $message;
                }
                ?>
                <form action="../index.php" method="post">
                    <input type="hidden" name="action" value="editCenter">
                    <div class="form-group">
                        <input type="hidden" name="idCenter" value="<?php echo $center['id'] ?>">
                        <label for="center">Center</label>
                        <input class="form-control" type="text" id="center" name="center" value="<?php echo $center['center'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input class="form-control" type="text" id="address" name="address" value="<?php echo $center['address'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input class="form-control" type="text" id="email" name="email" value="<?php echo $center['email'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input class="form-control" type="text" id="phone" name="phone" value="<?php echo $center['phone'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="city">City</label>
                        <input class="form-control" type="text" id="city" name="city" value="<?php echo $center['city'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="country">Country</label>
                        <input class="form-control" type="text" id="country" name="country" value="<?php echo $center['country'] ?>">
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
