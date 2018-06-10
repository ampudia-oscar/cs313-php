<!doctype html>
<html lang="en">
<head>
    <title>Login | Project Grupo IDIOMAS</title>
    <?php include "modules/header.php"; ?>
</head>
<body>
<?php include "modules/nav.php"; ?>
<main>
    <div class="container-fluid">
        <img class="" src="" title="">
        <form name="login" method="post" action=".">
            <input type="hidden" name="action" value="login"/>
            <div>
                <div class="form-isic">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input class="form-control" type="text" name="username" class="login-input"
                               value="<?php echo $username ?>">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input class="form-control" type="password" name="password" class="login-input"
                               value="<?php echo $password ?>">
                    </div>
                    <input type="submit" value="Login" class="btn submitButton"></td>
                </div>
                <!--<p><a href="index.php?action=logout">Logout</a></p>-->
            </div>
        </form>
        <p>
            <?php
            if ($message != "") {
                echo $message;
            }
            ?>
        </p>
        <p><b>Notice:</b> Unauthorized access is strictly prohibited and may be subject to criminal prosecution. </p>
    </div>
</main>
<hr>
<pre class="container-fluid">
        <?php echo $info ?>
        </pre>
<?php include "modules/footer.php" ?>
</body>
</html>
<?php
//echo "<pre>";
//print_r($_SESSION['customer']);
//echo "</pre>";