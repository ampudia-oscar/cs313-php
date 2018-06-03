<?php
session_start();

$_SESSION['customer']['firstName'] = strip_tags($_POST['firstName']);
$_SESSION['customer']['lastName'] = strip_tags($_POST['lastName']);
$_SESSION['customer']['address'] = strip_tags($_POST['address']);
$_SESSION['customer']['city'] = strip_tags($_POST['city']);
$_SESSION['customer']['state'] = $_POST['state'];
$_SESSION['customer']['zip'] = $_POST['zip'];
$_SESSION['customer']['email'] = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);


setcookie("cookie[firstName]", strip_tags($_POST['firstName']), time() + (86400 * 30), "/");
setcookie("cookie[lastName]", strip_tags($_POST['lastName']), time() + (86400 * 30), "/");
setcookie("cookie[address]", strip_tags($_POST['address']), time() + (86400 * 30), "/");
setcookie("cookie[city]", strip_tags($_POST['city']), time() + (86400 * 30), "/");
setcookie("cookie[state]", $_POST['state'], time() + (86400 * 30), "/");
setcookie("cookie[zip]", $_POST['zip'], time() + (86400 * 30), "/");
setcookie("cookie[email]", filter_var($_POST['email'], FILTER_SANITIZE_EMAIL), time() + (86400 * 30), "/");


//if (isset($_COOKIE['cookie'])) {
//    foreach ($_COOKIE['cookie'] as $c => $v) {
//        echo $c . ": " . $v . "<br>";
//    }
//}
?>
<!doctype html>
<html lang="en">
    <head>
        <title>Ampudia | Ecommerce - Confirm</title>
        <?php include $_SERVER['DOCUMENT_ROOT'] . "/modules/header.php"; ?>
    </head>
    <body>
        <div class="container-fluid">
            <?php include $_SERVER['DOCUMENT_ROOT'] . "/modules/nav.php" ?>
            <h1 class="text-secondary mt-5">CS 313 Course</h1>
            <div class="container">
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a href="index.php"><button class="btn btn-sm btn-light mr-1">Home</button></a>
                    </li>
                    <li class="nav-item">
                        <a href="checkout.php"><button class="btn btn-sm btn-success mr-1">Edit your data</button></a>
                    </li>
                    <li class="nav-item">
                        <a href="cart.php"><button class="btn btn-sm btn-success">Back to cart</button></a>
                    </li>
                </ul>
                <img class="sweetPlaceLogo" src="http://sweetplace.online/image/catalog/logo/logo.png">
                <p class="pt-5"></p>
                <h3>Confirm  your order</h3>
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Product</th>
                            <th class="text-right">Price</th>
                            <th class="text-right">Quantity</th>
                            <th class="text-right">Total</th>
                        </tr>
                    </thead>
                    <?php foreach ($_SESSION['products'] as $p): ?>
                        <?php if ($p['quantity']): ?>
                            <tr>
                                <td><img class="img50" src="images/<?php echo $p[0] ?>.png"></td>
                                <td><?php echo $p['name'] ?></td>
                                <td class="text-right">$<?php echo $p['price'] ?></td>
                                <td class="text-right"><?php echo $p['quantity'] ?></td>
                                <td class="text-right">$<?php echo number_format($p['total'], 2) ?></td>
                            </tr>
                        <?php endif; ?>
                    <?php endforeach; ?>
                    <tr>
                        <td class="text-right" colspan="5">
                            <p><b>TOTAL: $<?php echo number_format($_SESSION['checkout']['total'], 2) ?></b></p>
                        </td>
                    </tr>
                </table>
                <h3>Confirm you personal details</h3>
                <address>
                <?php echo $_SESSION['customer']['firstName'] ?> <?php echo $_SESSION['customer']['lastName'] ?><br>
                <?php echo $_SESSION['customer']['address'] ?><br>
                <?php echo $_SESSION['customer']['city'] ?>, <?php echo $_SESSION['customer']['state'] ?>, <?php echo $_SESSION['customer']['zip'] ?><br>
                </p>
                </address>
                <p><?php echo $_SESSION['customer']['email'] ?></p>
                <a href="success.php"><button class="btn btn-primary">Complete the purchase</button></a>
            </div>
        </div>
        <p class="pt-5"></p>
        <?php include $_SERVER['DOCUMENT_ROOT'] . "/modules/footer.php"; ?>
    </body>
</html>
<?php
//echo "<pre>";
//print_r($_COOKIE['cookie']);
//echo "</pre>";
