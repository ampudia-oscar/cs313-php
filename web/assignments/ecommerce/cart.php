<?php
session_start();

for ($i = 0; $i < count($_SESSION['products']); $i++) {
    if (isset($_POST[$_SESSION['products'][$i][0] . 'Quantity'])) {
        // Set session variables
        $_SESSION['products'][$i]['quantity'] = $_POST[$_SESSION['products'][$i][0] . 'Quantity'];
        $_SESSION['products'][$i]['total'] = $_SESSION['products'][$i]['price'] * $_SESSION['products'][$i]['quantity'];
    }
}

$_SESSION['checkout']['total'] = 0;
for ($i = 0; $i < count($_SESSION['products']); $i++) {
    $_SESSION['checkout']['total'] += $_SESSION['products'][$i]['total'];
}
?>

<!doctype html>
<html lang="en">
    <head>
        <title>Ampudia | Ecommerce - Cart</title>
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
                        <?php if ($_SESSION['checkout']['total'] > 0): ?>
                        <a href="checkout.php"><button class="btn btn-sm btn-success mr-1">Proceed to checkout</button></a>
                        <?php endif; ?>
                    </li>
                </ul>
                <img class="sweetPlaceLogo" src="http://sweetplace.online/image/catalog/logo/logo.png">
                <p class="pt-5"></p>
                <form action="cart.php" method="post">
                    <table class="table">
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
                                    <td><img class="img100" src="images/<?php echo $p[0] ?>.png"></td>
                                    <td><?php echo $p['name'] ?></td>
                                    <td class="text-right">$<?php echo $p['price'] ?></td>
                                    <td class="text-right">
                                        <input class="text-right" id="<?php echo $p[0] ?>Quantity" name="<?php echo $p[0] ?>Quantity" type="number" value="<?php echo $p['quantity'] ?>">
                                    </td>
                                    <td class="text-right">$<?php echo number_format($p['total'], 2) ?></td>
                                </tr>
                            <?php endif; ?>
                        <?php endforeach; ?>
                        <tr>
                            <td class="text-right" colspan="5">
                                <p><small>Change the quantity of items and click on the Refresh button to make changes. Type 0 if you want to delete.</small></p>
                                <p><button type="submit" class="btn btn-outline-primary">Refresh</button></p>
                                <p><b>TOTAL: $<?php echo number_format($_SESSION['checkout']['total'], 2) ?></b></p>
                                <?php if ($_SESSION['checkout']['total'] > 0): ?>
                                <a href="checkout.php"><button class="btn btn-sm btn-success mr-1" type="button">Proceed to Checkout</button></a>
                                <?php endif; ?>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <p class="pt-5"></p>
        <?php include $_SERVER['DOCUMENT_ROOT'] . "/modules/footer.php"; ?>
    </body>
</html>
<?php
//echo "<pre>";
//print_r($_SESSION['customer']);
//echo "</pre>";