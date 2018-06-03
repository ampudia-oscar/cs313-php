<?php
session_start();
//session_unset();
//session_destroy();

if (!isset($_SESSION['products'])) {
    $_SESSION['products'] = array(
        array("custom", "name" => "Candy Heart", "price" => 2, "type" => "per unit", "description" => "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.", "quantity" => 0, "total" => 0),
        array("flower", "name" => "Flower Candy", "price" => 5, "type" => "per unit", "description" => "Aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis.", "quantity" => 0, "total" => 0),
        array("fruit", "name" => "Candy Rock Fruits", "price" => 25, "type" => "per kg.", "description" => "A commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie covel.", "quantity" => 0, "total" => 0),
        array("rockHearts", "name" => "Candy Rock Hearts", "price" => 25, "type" => "per kg.", "description" => "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, mus.", "quantity" => 0, "total" => 0),
        array("pop", "name" => "Lollipop", "price" => 1.50, "type" => "per unit", "description" => "Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad naus. Souvlaki.", "quantity" => 0, "total" => 0),
        array("rock", "name" => "Custom Candy Rock", "price" => 25, "type" => "per kg.", "description" => "Marquee selectus non provisio incongruous feline nolo contendre. Gratuitous octopus niacin, sodium glut.", "quantity" => 0, "total" => 0),
        array("claritas", "name" => "Claritas", "price" => 3, "type" => "2 kg bag", "description" => "Europa usa li sam vocabularium. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun.", "quantity" => 0, "total" => 0),
        array("toffees", "name" => "Toffees", "price" => 3.50, "type" => "2 kg bag", "description" => "Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent.", "quantity" => 0, "total" => 0)
    );
}

for ($i = 0; $i < count($_SESSION['products']); $i++) {
    if (isset($_POST[$_SESSION['products'][$i][0] . 'Quantity']) && $_POST[$_SESSION['products'][$i][0] . 'Quantity'] > 0) {
        // Set session variables
        $_SESSION['products'][$i]['quantity'] += $_POST[$_SESSION['products'][$i][0] . 'Quantity'];
        $_SESSION['products'][$i]['total'] = $_SESSION['products'][$i]['price'] * $_SESSION['products'][$i]['quantity'];
    }
}

$_SESSION['items'] = 0;
$_SESSION['checkout']['total'] = 0;

for ($i = 0; $i < count($_SESSION['products']); $i++) {
    if ($_SESSION['products'][$i]['quantity'] > 0) {
        $_SESSION['items']++;
    }
    $_SESSION['checkout']['total'] += $_SESSION['products'][$i]['total'];
}
?>

<!doctype html>
<html lang="en">
    <head>
        <title>Ampudia | Ecommerce</title>
        <?php include "../../modules/header.php"; ?>
    </head>
    <body>
        <div class="container-fluid">
            <?php include "../../modules/nav.php" ?>
            <h1 class="text-secondary mt-5">CS 313 – Ecommerce</h1>
            <div class="container">
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a href="index.php"><button class="btn btn-sm btn-light mr-1">Home</button></a>
                    </li>
                    <li class="nav-item">
                        <a href="cart.php"><button class="btn btn-sm btn-success mr-1"><img class="cart" src="images/cart.png"> <?php echo $_SESSION['items'] ?> product(s) - $<?php echo number_format($_SESSION['checkout']['total'],2) ?></button></a>
                    </li>
                </ul>
                <img class="sweetPlaceLogo" src="http://sweetplace.online/image/catalog/logo/logo.png">
                <p class="pt-5"></p>
                <div class="row">
                    <?php foreach ($_SESSION['products'] as $p): ?>
                        <div class="col-sm">
                            <form action="index.php" method="post" id="<?php echo $p[0] ?>">
                                <div class="itemContainer rounded float-left img-thumbnail ">
                                    <a href="#" data-toggle="modal" data-target="#<?php echo $p[0] ?>Description"><img class="img100p" src="images/<?php echo $p[0] ?>.png"></a>
                                    <p class="text-center"><small><?php echo $p['name'] ?></small><br>
                                        <b>$<?php echo number_format($p['price'],2) ?></b><br>
                                        <small class="note">(<?php echo $p['type'] ?>)</small>
                                    <div class="input-group input-group-sm mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-sm">Quantity</span>
                                        </div>
                                        <input id="<?php echo $p[0] ?>Quantity" name="<?php echo $p[0] ?>Quantity" value="1" type="number" class="form-control" aria-label="Cart" aria-describedby="inputGroup-sizing-sm">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-primary" type="submit">Add to cart</button>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal -->
                                <div class="modal fade" id="<?php echo $p[0] ?>Description" tabindex="-1" role="dialog" aria-labelledby="<?php echo $p[0] ?>DescriptionLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="<?php echo $p[0] ?>DescriptionLabel"><?php echo $p['name'] ?></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <?php if ($p['quantity'] && $p['quantity'] != 0): ?>
                                                    <p>In shopping cart: <b><?php echo $p['quantity'] ?></b> Total: <b>$<?php echo number_format($p['total'], 2) ?></b></p>
                                                <?php endif; ?>
                                                <img class="img100p" src="images/<?php echo $p[0] ?>.png">
                                                <p><?php echo $p['description'] ?></p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                                                <?php if ($p['total']): ?>
                                                    <a href="cart.php"><button type="button" class="btn btn-success">View cart</button></a>
                                                <?php endif; ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    <?php endforeach; ?>
                </div>
                <br>
                <ul class="nav justify-content-end">
                    <li class="nav-item">
                        <a href="cart.php"><button class="btn btn-sm btn-success mr-1"><img class="cart" src="images/cart.png"> <?php echo $_SESSION['items'] ?> product(s) - $<?php echo number_format($_SESSION['checkout']['total'],2) ?></button></a>
                    </li>
                </ul>
            </div>
        </div>
        <p class="pt-5"></p>
        <?php include "../../modules/footer.php"; ?>
    </body>
</html>
<?php
//echo "<pre>";
//print_r($_SESSION['customer']);
//echo "</pre>";