<?php
session_start();

$_SESSION['states'] = array("AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FM", "FL", "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MH", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PW", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY");
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
                        <a href="index.php"><button class="btn btn-sm btn-light mr-1">Home</button></a>
                    </li>
                    <li class="nav-item">
                        <a href="cart.php"><button class="btn btn-sm btn-success mr-1">Back to cart</button></a>
                    </li>
                </ul>
                <img class="sweetPlaceLogo" src="http://sweetplace.online/image/catalog/logo/logo.png">
                <p class="pt-5"></p>
                <h2>Your Personal Details</h2>
                <form class="needs-validation" action="confirm.php" method="post">
                    <div class="form-row">
                        <div class="col-md-3 mb-3">
                            <label>First name</label>
                            <input value="<?php echo $_COOKIE['cookie']['firstName'] ?>" id="fistName" name="firstName" type="text" class="form-control" placeholder="First name" required>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Last name</label>
                            <input value="<?php echo $_COOKIE['cookie']['lastName'] ?>" id="lastName" name="lastName" type="text" class="form-control" placeholder="Last name" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label>Address</label>
                            <input value="<?php echo $_COOKIE['cookie']['address'] ?>" id="address" name="address" type="text" class="form-control" placeholder="Address" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-2 mb-3">
                            <label>City</label>
                            <input value="<?php echo $_COOKIE['cookie']['city'] ?>" id="city" name="city" type="text" class="form-control" placeholder="City" required>
                        </div>
                        <div class="form-group col-md-2 mb-3">
                            <label>State</label>
                            <select id="state" name="state" class="form-control">
                                <?php foreach ($_SESSION['states'] as $state): ?>
                                    <?php if ($state === $_COOKIE['cookie']['state']): ?>
                                        <option value="<?php echo $state ?>" selected><?php echo $state ?></option>
                                    <?php else: ?>
                                        <option value="<?php echo $state ?>"><?php echo $state ?></option>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>Zip</label>
                            <input value="<?php echo $_COOKIE['cookie']['zip'] ?>" id="zip" name="zip" type="number" class="form-control" placeholder="Zip" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label>Email</label>
                            <input value="<?php echo $_COOKIE['cookie']['email'] ?>" id="email" name="email" type="text" class="form-control" placeholder="Email" required>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit">Continue</button>
                </form>
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