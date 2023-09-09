<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevOps Task</title>
    <style>
        body {
            background-color: #222;
            /* Darker background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
            background-color: #333;
            /* Slightly darker container background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            font-size: 26px;
        }

        h2 {
            color: #fff;
            /* White text */
            font-size: 70px;
        }

        h3 {
            color: #0099cc;
            /* Light blue text */
            font-size: 60px;
        }

    </style>
</head>

<body>
    <div class="container">
        <?php
        include 'Hello.php';

        echo "<h2>DevOps Task</h2>";
        echo "<h3>Host: " . gethostname() . "</h3>";

        $hello = new Hello();
        echo "<h3>" . $hello->sayHello('World') . "</h3>";

        // Database credentials from environment variables
        $servername = getenv('MYSQL_HOST');
        $username = getenv('MYSQL_USER');
        $password = getenv('MYSQL_PASSWORD');

        // Create connection
        $conn = new mysqli($servername, $username, $password);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // SQL query 
        $sql = "SHOW PROCESSLIST";
        $result = $conn->query($sql);

        // Print the result
        echo "<pre style='font-size: 10px; color: white;'>"; 
        echo "\nExecuting \"SHOW PROCESSLIST;\" query in mysql:\n\n";
        print_r($result);
        echo "\nps: I have added this part to demonstrate the connection of mysql from app servers.";
        echo "</pre>";

        // Close the connection when done
        $conn->close();
        ?>
    </div>
</body>

</html>