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
        <?php include "../modules/header.php"; ?>
    </head>
    <body>
        <?php include "../modules/nav.php"; ?>
        <main>
            <div class="container-fluid">
                <img class="" src="" title="">
                <h1 class="pb-3">School <a href="../index.php"><button class="btn btn-outline-danger">Back</button></a></h1>
                <h2>Add New</h2>
                <?php
                if ($message != "") {
                    echo $message;
                }
                ?>
                <form action="../index.php" method="post">
                    <input type="hidden" name="action" value="addSchool">
                    <div class="form-group">
                        <label for="schoolName">Name</label>
                        <input class="form-control" id="schoolName" name="schoolName" type="text" value="<?php echo $school ?>" required>
                        <small id="namelHelp" class="form-text text-muted">Required value.</small>
                    </div>
                    <div class="form-group">
                        <label for="schoolEmail">Email</label>
                        <input class="form-control" id="schoolEmail" name="schoolEmail" type="email" value="<?php echo $email ?>">
                    </div>
                    <div class="form-group">
                        <label for="schoolWebsite">Website</label>
                        <input class="form-control" id="schoolWebsite" name="schoolWebsite" type="text" value="<?php echo $website ?>">
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
