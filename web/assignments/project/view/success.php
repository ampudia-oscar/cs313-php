<?php
session_start();

if (!isset($_SESSION['valid_user'])) {
    $action = 'login';
}
?>
<!doctype html>
<html lang="en">
    <head>
        <title><?php echo $_SESSION['username'] ?> | Project Grupo IDIOMAS</title>
        <?php include "modules/header.php"; ?>
    </head>
    <body>
        <?php include "modules/nav.php"; ?>
        <main>
            <div class="container-fluid">
                <img class="" src="" title="">
                <h2>Record saved</h2>
                <div class="pb-3">The changes made to <b><?php echo $school ?> <?php echo $center ?></b> has been saved into the database.</div>
                <a href="index.php"><button class="btn btn-outline-danger">Back</button></a>
        </main>
        <hr>
        <pre class="container-fluid">
            <?php echo $info ?>
        </pre>
        <?php include "modules/footer.php" ?>
    </body>
</html>
