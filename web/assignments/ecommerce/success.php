<?php   
session_start();
session_unset();
session_destroy();
?>
<!doctype html>
<html lang="en">
    <head>
        <title>Ampudia | Ecommerce - Checkout</title>
        <?php include $_SERVER['DOCUMENT_ROOT'] . "/modules/header.php"; ?>
    </head>
    <body>
        <div class="container-fluid">
            <?php include $_SERVER['DOCUMENT_ROOT'] . "/modules/nav.php" ?>
            <h1 class="text-secondary mt-5">CS 313 Course</h1>
            <div class="container">
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a class="nav-link active" href="index.php">Home</a>
                    </li>
                </ul>
                <img class="sweetPlaceLogo" src="http://sweetplace.online/image/catalog/logo/logo.png">
                <p class="pt-5"></p>
                <p>Thank you for your purchase! Your items will arrive to your home soon!</p>
                <a class="nav-link active" href="index.php"><button class="btn btn-primary">Back to Homepage</button></a>
            </div>
            <p class="pt-5"></p>
            <?php include $_SERVER['DOCUMENT_ROOT'] . "/modules/footer.php"; ?>
        </div>
    </body>
</html>
</body>
</html>
<?php
//echo "<pre>";
//print_r($_SESSION);
//echo "</pre>";