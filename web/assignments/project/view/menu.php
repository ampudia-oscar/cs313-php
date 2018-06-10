<?php
session_start();

if (!isset($_SESSION['valid_user'])) {
    $action = 'login';
    header('Location:../index.php');
    exit;
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
                <h1 class="pb-3">Welcome <?php echo $_SESSION['username'] ?></h1>
                <div class="row float-right mr-2">
                    <a href="view/addSchool.php"><button class="btn btn-primary" type="button" id="addSchool" name="addSchool">Add School</button></a>
                </div>
                <h2>Select a School</h2>
                <?php
                if ($message != "") {
                    echo $message;
                }
                ?>

                <table class="table">
                    <tr>
                        <td>  
                            <?php foreach ($schools as $s): ?>
                                <form id="form<?php echo $s['school'] ?>" method="get" action="view/center.php?<?php echo $s['id'] ?>">
                                    <input type="hidden" name="idSchool" value="<?php echo $s['id'] ?>">
                                    <button value="<?php echo $s['school'] ?>" type="submit" class="btn btn-light"><?php echo $s['school'] ?></button>
                                </form>
                                <hr>
                            <?php endforeach; ?>
                        </td>
                        <td>
                            <?php foreach ($schools as $s): ?>
                                <form id="form<?php echo $s['school'] ?>" method="get" action="view/editSchool.php">
                                    <input type="hidden" name="idSchool" value="<?php echo $s['id'] ?>">
                                    <a href="editSchool.php?idSchool=<?php echo $idSchool ?>"><button class="btn btn-outline-secondary">Edit</button></a>
                                </form>
                                <hr>
                            <?php endforeach; ?>
                        </td>
                    </tr>
                </table>
            </div>
        </main>
        <?php include "modules/footer.php" ?>
    </body>
</html>
