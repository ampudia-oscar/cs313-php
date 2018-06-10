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
                <h1 class="pb-3">Center <a href="../view/center.php?idSchool=<?php echo $idSchool ?>"><button class="btn btn-outline-danger">Back</button></a></h1>
                <h2>Add new center to <?php echo $school['school'] ?></h2>
                <?php
                if ($message != "") {
                    echo $message;
                }
                ?>
                <form action="../index.php" method="post">
                    <input type="hidden" name="action" value="addCenter">
                    <input type="hidden" id="idSchool" name="idSchool" value="<?php echo $idSchool ?>" required>
                    <div class="form-group">
                        <label for="centerName">Name</label>
                        <input class="form-control" id="centerName" name="centerName" type="text" value="<?php echo $center ?>" required>
                        <small id="namelHelp" class="form-text text-muted">Required value.</small>
                    </div>
                    <div class="form-group">
                        <label for="centerAddress">Address</label>
                        <input class="form-control" id="centerAddress" name="centerAddress" type="text" value="<?php echo $address ?>">
                    </div>
                    <div class="form-group">
                        <label for="centerEmail">Email</label>
                        <input class="form-control" id="centerEmail" name="centerEmail" type="text" value="<?php echo $email ?>">
                    </div>
                    <div class="form-group">
                        <label for="centerPhone">Phone</label>
                        <input class="form-control" id="centerPhone" name="centerPhone" type="text" value="<?php echo $phone ?>">
                    </div>
                    <div class="form-group">
                        <label for="centerCity">City</label>
                        <input class="form-control" id="centerCity" name="centerCity" type="text" value="<?php echo $city ?>" required>
                        <small id="citylHelp" class="form-text text-muted">Required value.</small>
                    </div>
                    <div class="form-group">
                        <label for="centerCountry">Country</label>
                        <input class="form-control" id="centerCountry" name="centerCountry" type="text" value="<?php echo $country ?>" required>
                        <small id="countrylHelp" class="form-text text-muted">Required value.</small>
                    </div>
                    <button type="submit" class="btn btn-success">Submit</button>
                </form>

            </div>
        </main>
        <pre class="container-fluid">
            <?php echo $info ?>
        </pre>
        <?php include "../modules/footer.php" ?>
    </body>
</html>
