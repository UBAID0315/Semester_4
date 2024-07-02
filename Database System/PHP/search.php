<!DOCTYPE html>
<html lang="en">
<head>
	<title>Registeration Form</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="POST">
					<span class="login100-form-logo">
						<img src="https://imgs.search.brave.com/ccwsFlM9IHgEnXOuRjwmkSEsiZlGcWmTsLrGEnImzhM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/ZW50aXJldGVzdC5j/b20vd3AtY29udGVu/dC91cGxvYWRzLzIw/MTEvMTEvTmF0aW9u/YWwtVW5pdmVyc2l0/eS1vZi1Db21wdXRl/ci1FbWVyZ2luZy1T/Y2llbmNlcy1GQVNU/LUxvZ28ucG5n" alt="">
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						NUTEC Registeration
					</span>
					
					<div class="wrap-input100 validate-input" data-validate="Enter Roll no">
						<input class="input100" type="text" name="rollno" placeholder="Roll no" pattern="\d{2}P-\d{4}" oninput="autoInsertDash(this)">
						<span class="focus-input100" data-placeholder="&#x23;"></span>
					</div>

					<div class="container-login100-form-btn" style="margin-top:10px">
						<button class="login100-form-btn">
							<a href="search.php">Search</a>
						</button>
					</div>
					<?php

                        $rollno = $_POST['rollno'];

						$servername = "localhost";
						$username = "root";
						$password = "";
						$database = "nutec";
						
						$conn = new mysqli($servername, $username, $password, $database);
						
						if ($conn->connect_error) 
                        {
                            die("Connection failed: " . $conn->connect_error);
                        }
                        
                        $query = "SELECT * FROM REGISTERATION WHERE ROLL_NO = '$rollno'";
                        $result = $conn->query($query);
                        
                        if ($result) 
                        {
                            if ($result->num_rows > 0) 
                            {
                                while ($row = $result->fetch_assoc()) 
                                {
                                    echo "<br>";
                                    echo "Roll No: " . $row["ROLL_NO"] . "<br>";
                                    echo "Department: " . $row["DEPARTMENT"] . "<br>";
                                    echo "Event: " . $row["EVENT_NAME"] . "<br>";
                                }
                            } else 
                            {
                                echo "<br>";
                                echo "No results found";
                            }
                        } else {
                            echo "Error: " . $query . "<br>" . $conn->error;
                        }
                        
                        // Close connection
                        $conn->close();
					?>
				</form>
			</div>
		</div>
	</div>
	
<script>
	function autoInsertDash(input) {
    const value = input.value.trim();
    const firstChar = value.charAt(0);
    const secondChar = value.charAt(1);
    const thirdChar = value.charAt(2);

    if (value.length <= 2) 
	{
        if (/^[0-9]+$/.test(firstChar) || /^[0-9]+$/.test(secondChar)) {
            input.value = firstChar + secondChar;
        }
    } else 
	{
        if (/^[a-zA-Z]+$/.test(thirdChar)) 
		{ // Check alphabetic value
            input.value = firstChar + secondChar + thirdChar.toUpperCase() + '-';
            if (value.length > 3) {
                input.value += value.substring(4, 8); // Add 4 digits after the dash
            }
        } else 
		{
            input.value = value.substring(0, 2);
        }
    }
}

</script>
	  
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>