<!doctype html>
<html lang="en">
<head>
<title>Ampudia | Home</title>
<?php include "modules/header.php"; ?>
</head>
<body>
<div class="container-fluid">
	<?php include "modules/nav.php" ?>
	<h1 class="text-secondary mt-5">CS 313 Course</h1>
	<p class="font-weight-light"><?php echo "Today is " . date("Y-m-d"); ?></p>
	<img class="profile" src="https://yt3.ggpht.com/-Pc13-mWxrmg/AAAAAAAAAAI/AAAAAAAAAa4/qJBLv0TGibE/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg">
	<h2>About me</h2>
	<p>I'm Oscar Ampudia. I want to learn how to make web applications.</p>
	<div class="navbar fixed-bottom navbar-dark bg-dark text-light"><small>© Oscar Ampudia</small></div>
	<hr>
	<h3>Server Info:</h3>
	<?php
		echo "<b>Name: </b>".$_SERVER['SERVER_NAME'];
		echo "<br>";
		echo "<b>Host IP Address: </b>".$_SERVER['SERVER_ADDR'];
		echo "<br>";
		echo "<b>Software: </b>".$_SERVER['SERVER_SOFTWARE'];
		echo "<br>";	
		echo "<b>User IP Address: </b>".$_SERVER['REMOTE_ADDR'];
	?>
	<?php include "modules/footer.php"; ?>
</div>
</body>
</html>